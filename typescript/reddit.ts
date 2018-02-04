// To parse this data:
//
//   import { Convert, Reddit } from "./file";
//
//   const reddit = Convert.toReddit(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

export interface Reddit {
    kind: string;
    data: RedditData;
}

export interface RedditData {
    after:            string;
    dist:             number;
    modhash:          string;
    whitelist_status: string;
    children:         Child[];
    before:           null;
}

export interface Child {
    kind: Kind;
    data: ChildData;
}

export interface ChildData {
    domain:                  string;
    approved_at_utc:         null;
    mod_reason_by:           null;
    banned_by:               null;
    num_reports:             null;
    subreddit_id:            string;
    thumbnail_width?:        number;
    subreddit:               string;
    selftext_html?:          string;
    selftext:                string;
    likes:                   null;
    suggested_sort?:         string;
    user_reports:            any[];
    secure_media?:           Media;
    is_reddit_media_domain:  boolean;
    link_flair_text?:        string;
    id:                      string;
    banned_at_utc:           null;
    mod_reason_title:        null;
    view_count:              null;
    archived:                boolean;
    clicked:                 boolean;
    media_embed:             MediaEmbed;
    report_reasons:          null;
    author:                  string;
    num_crossposts:          number;
    saved:                   boolean;
    mod_reports:             any[];
    can_mod_post:            boolean;
    is_crosspostable:        boolean;
    pinned:                  boolean;
    score:                   number;
    approved_by:             null;
    over_18:                 boolean;
    hidden:                  boolean;
    preview:                 Preview;
    thumbnail:               string;
    edited:                  boolean;
    link_flair_css_class?:   string;
    author_flair_css_class?: string;
    contest_mode:            boolean;
    gilded:                  number;
    downs:                   number;
    brand_safe:              boolean;
    secure_media_embed:      MediaEmbed;
    removal_reason:          null;
    post_hint:               PostHint;
    author_flair_text?:      string;
    stickied:                boolean;
    can_gild:                boolean;
    thumbnail_height?:       number;
    parent_whitelist_status: WhitelistStatus;
    name:                    string;
    spoiler:                 boolean;
    permalink:               string;
    subreddit_type:          SubredditType;
    locked:                  boolean;
    hide_score:              boolean;
    created:                 number;
    url:                     string;
    whitelist_status:        WhitelistStatus;
    quarantine:              boolean;
    title:                   string;
    created_utc:             number;
    subreddit_name_prefixed: string;
    ups:                     number;
    media?:                  Media;
    num_comments:            number;
    is_self:                 boolean;
    visited:                 boolean;
    mod_note:                null;
    is_video:                boolean;
    distinguished:           null;
}

export interface Media {
    type:   MediaType;
    oembed: Oembed;
}

export interface Oembed {
    provider_url:     ProviderURL;
    description?:     string;
    title:            string;
    thumbnail_width:  number;
    height:           number;
    width:            number;
    html:             string;
    version:          Version;
    provider_name:    ProviderName;
    thumbnail_url:    string;
    type:             OembedType;
    thumbnail_height: number;
    author_name?:     string;
    author_url?:      string;
}

export enum ProviderName {
    Clippit = "Clippit",
    Gfycat = "gfycat",
    YouTube = "YouTube",
}

export enum ProviderURL {
    HTTPClippitTv = "http://clippit.tv",
    HTTPGfycatCOM = "http://gfycat.com",
    HTTPSWWWYoutubeCOM = "https://www.youtube.com/",
}

export enum OembedType {
    Video = "video",
}

export enum Version {
    The10 = "1.0",
}

export enum MediaType {
    ClippituserTv = "clippituser.tv",
    GfycatCOM = "gfycat.com",
    YoutubeCOM = "youtube.com",
}

export interface MediaEmbed {
    content?:          string;
    width?:            number;
    scrolling?:        boolean;
    height?:           number;
    media_domain_url?: string;
}

export enum WhitelistStatus {
    AllAds = "all_ads",
    PromoAll = "promo_all",
    PromoSpecified = "promo_specified",
}

export enum PostHint {
    Image = "image",
    Link = "link",
    RichVideo = "rich:video",
    Self = "self",
}

export interface Preview {
    images:  Image[];
    enabled: boolean;
}

export interface Image {
    source:      Resolution;
    resolutions: Resolution[];
    variants:    Variants;
    id:          string;
}

export interface Resolution {
    url:    string;
    width:  number;
    height: number;
}

export interface Variants {
    gif?: GIF;
    mp4?: GIF;
}

export interface GIF {
    source:      Resolution;
    resolutions: Resolution[];
}

export enum SubredditType {
    Public = "public",
}

export enum Kind {
    T3 = "t3",
}

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
export module Convert {
    export function toReddit(json: string): Reddit {
        return cast(JSON.parse(json), O("Reddit"));
    }

    export function redditToJson(value: Reddit): string {
        return JSON.stringify(value, null, 2);
    }
    
    function cast<T>(obj: any, typ: any): T {
        if (!isValid(typ, obj)) {
            throw `Invalid value`;
        }
        return obj;
    }

    function isValid(typ: any, val: any): boolean {
        if (typ === undefined) return true;
        if (typ === null) return val === null || val === undefined;
        return typ.isUnion  ? isValidUnion(typ.typs, val)
                : typ.isArray  ? isValidArray(typ.typ, val)
                : typ.isMap    ? isValidMap(typ.typ, val)
                : typ.isEnum   ? isValidEnum(typ.name, val)
                : typ.isObject ? isValidObject(typ.cls, val)
                :                isValidPrimitive(typ, val);
    }

    function isValidPrimitive(typ: string, val: any) {
        return typeof typ === typeof val;
    }

    function isValidUnion(typs: any[], val: any): boolean {
        // val must validate against one typ in typs
        return typs.find(typ => isValid(typ, val)) !== undefined;
    }

    function isValidEnum(enumName: string, val: any): boolean {
        const cases = typeMap[enumName];
        return cases.indexOf(val) !== -1;
    }

    function isValidArray(typ: any, val: any): boolean {
        // val must be an array with no invalid elements
        return Array.isArray(val) && val.every((element, i) => {
            return isValid(typ, element);
        });
    }

    function isValidMap(typ: any, val: any): boolean {
        if (val === null || typeof val !== "object" || Array.isArray(val)) return false;
        // all values in the map must be typ
        return Object.keys(val).every(prop => {
            if (!Object.prototype.hasOwnProperty.call(val, prop)) return true;
            return isValid(typ, val[prop]);
        });
    }

    function isValidObject(className: string, val: any): boolean {
        if (val === null || typeof val !== "object" || Array.isArray(val)) return false;
        let typeRep = typeMap[className];
        return Object.keys(typeRep).every(prop => {
            if (!Object.prototype.hasOwnProperty.call(typeRep, prop)) return true;
            return isValid(typeRep[prop], val[prop]);
        });
    }

    function A(typ: any) {
        return { typ, isArray: true };
    }

    function E(name: string) {
        return { name, isEnum: true };
    }

    function U(...typs: any[]) {
        return { typs, isUnion: true };
    }

    function M(typ: any) {
        return { typ, isMap: true };
    }

    function O(className: string) {
        return { cls: className, isObject: true };
    }

    const typeMap: any = {
        "Reddit": {
            kind: "",
            data: O("RedditData"),
        },
        "RedditData": {
            after: "",
            dist: 0,
            modhash: "",
            whitelist_status: "",
            children: A(O("Child")),
            before: null,
        },
        "Child": {
            kind: E("Kind"),
            data: O("ChildData"),
        },
        "ChildData": {
            domain: "",
            approved_at_utc: null,
            mod_reason_by: null,
            banned_by: null,
            num_reports: null,
            subreddit_id: "",
            thumbnail_width: U(0, null),
            subreddit: "",
            selftext_html: U(null, ""),
            selftext: "",
            likes: null,
            suggested_sort: U(null, ""),
            user_reports: A(undefined),
            secure_media: U(O("Media"), null),
            is_reddit_media_domain: false,
            link_flair_text: U(null, ""),
            id: "",
            banned_at_utc: null,
            mod_reason_title: null,
            view_count: null,
            archived: false,
            clicked: false,
            media_embed: O("MediaEmbed"),
            report_reasons: null,
            author: "",
            num_crossposts: 0,
            saved: false,
            mod_reports: A(undefined),
            can_mod_post: false,
            is_crosspostable: false,
            pinned: false,
            score: 0,
            approved_by: null,
            over_18: false,
            hidden: false,
            preview: O("Preview"),
            thumbnail: "",
            edited: false,
            link_flair_css_class: U(null, ""),
            author_flair_css_class: U(null, ""),
            contest_mode: false,
            gilded: 0,
            downs: 0,
            brand_safe: false,
            secure_media_embed: O("MediaEmbed"),
            removal_reason: null,
            post_hint: E("PostHint"),
            author_flair_text: U(null, ""),
            stickied: false,
            can_gild: false,
            thumbnail_height: U(0, null),
            parent_whitelist_status: E("WhitelistStatus"),
            name: "",
            spoiler: false,
            permalink: "",
            subreddit_type: E("SubredditType"),
            locked: false,
            hide_score: false,
            created: 3.14,
            url: "",
            whitelist_status: E("WhitelistStatus"),
            quarantine: false,
            title: "",
            created_utc: 3.14,
            subreddit_name_prefixed: "",
            ups: 0,
            media: U(O("Media"), null),
            num_comments: 0,
            is_self: false,
            visited: false,
            mod_note: null,
            is_video: false,
            distinguished: null,
        },
        "Media": {
            type: E("MediaType"),
            oembed: O("Oembed"),
        },
        "Oembed": {
            provider_url: E("ProviderURL"),
            description: U(null, ""),
            title: "",
            thumbnail_width: 0,
            height: 0,
            width: 0,
            html: "",
            version: E("Version"),
            provider_name: E("ProviderName"),
            thumbnail_url: "",
            type: E("OembedType"),
            thumbnail_height: 0,
            author_name: U(null, ""),
            author_url: U(null, ""),
        },
        "MediaEmbed": {
            content: U(null, ""),
            width: U(null, 0),
            scrolling: U(null, false),
            height: U(null, 0),
            media_domain_url: U(null, ""),
        },
        "Preview": {
            images: A(O("Image")),
            enabled: false,
        },
        "Image": {
            source: O("Resolution"),
            resolutions: A(O("Resolution")),
            variants: O("Variants"),
            id: "",
        },
        "Resolution": {
            url: "",
            width: 0,
            height: 0,
        },
        "Variants": {
            gif: U(null, O("GIF")),
            mp4: U(null, O("GIF")),
        },
        "GIF": {
            source: O("Resolution"),
            resolutions: A(O("Resolution")),
        },
        "ProviderName": [
            ProviderName.Clippit,
            ProviderName.Gfycat,
            ProviderName.YouTube,
        ],
        "ProviderURL": [
            ProviderURL.HTTPClippitTv,
            ProviderURL.HTTPGfycatCOM,
            ProviderURL.HTTPSWWWYoutubeCOM,
        ],
        "OembedType": [
            OembedType.Video,
        ],
        "Version": [
            Version.The10,
        ],
        "MediaType": [
            MediaType.ClippituserTv,
            MediaType.GfycatCOM,
            MediaType.YoutubeCOM,
        ],
        "WhitelistStatus": [
            WhitelistStatus.AllAds,
            WhitelistStatus.PromoAll,
            WhitelistStatus.PromoSpecified,
        ],
        "PostHint": [
            PostHint.Image,
            PostHint.Link,
            PostHint.RichVideo,
            PostHint.Self,
        ],
        "SubredditType": [
            SubredditType.Public,
        ],
        "Kind": [
            Kind.T3,
        ],
    };
}
