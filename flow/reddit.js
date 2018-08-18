// To parse this data:
//
//   const Convert = require("./file");
//
//   const reddit = Convert.toReddit(json);
//
// These functions will throw an error if the JSON doesn't
// match the expected interface, even if the JSON is valid.

// Converts JSON strings to/from your types
// and asserts the results of JSON.parse at runtime
function toReddit(json) {
    return cast(JSON.parse(json), r("Reddit"));
}

function redditToJson(value) {
    return JSON.stringify(uncast(value, r("Reddit")), null, 2);
}

function invalidValue(typ, val) {
    throw Error(`Invalid value ${JSON.stringify(val)} for type ${JSON.stringify(typ)}`);
}

function jsonToJSProps(typ) {
    if (typ.jsonToJS === undefined) {
        var map = {};
        typ.props.forEach((p) => map[p.json] = { key: p.js, typ: p.typ });
        typ.jsonToJS = map;
    }
    return typ.jsonToJS;
}

function jsToJSONProps(typ) {
    if (typ.jsToJSON === undefined) {
        var map = {};
        typ.props.forEach((p) => map[p.js] = { key: p.json, typ: p.typ });
        typ.jsToJSON = map;
    }
    return typ.jsToJSON;
}

function transform(val, typ, getProps) {
    function transformPrimitive(typ, val) {
        if (typeof typ === typeof val) return val;
        return invalidValue(typ, val);
    }

    function transformUnion(typs, val) {
        // val must validate against one typ in typs
        var l = typs.length;
        for (var i = 0; i < l; i++) {
            var typ = typs[i];
            try {
                return transform(val, typ, getProps);
            } catch (_) {}
        }
        return invalidValue(typs, val);
    }

    function transformEnum(cases, val) {
        if (cases.indexOf(val) !== -1) return val;
        return invalidValue(cases, val);
    }

    function transformArray(typ, val) {
        // val must be an array with no invalid elements
        if (!Array.isArray(val)) return invalidValue("array", val);
        return val.map(el => transform(el, typ, getProps));
    }

    function transformObject(props, additional, val) {
        if (val === null || typeof val !== "object" || Array.isArray(val)) {
            return invalidValue("object", val);
        }
        var result = {};
        Object.getOwnPropertyNames(props).forEach(key => {
            const prop = props[key];
            const v = Object.prototype.hasOwnProperty.call(val, key) ? val[key] : undefined;
            result[prop.key] = transform(v, prop.typ, getProps);
        });
        Object.getOwnPropertyNames(val).forEach(key => {
            if (!Object.prototype.hasOwnProperty.call(props, key)) {
                result[key] = transform(val[key], additional, getProps);
            }
        });
        return result;
    }

    if (typ === "any") return val;
    if (typ === null) {
        if (val === null) return val;
        return invalidValue(typ, val);
    }
    if (typ === false) return invalidValue(typ, val);
    while (typeof typ === "object" && typ.ref !== undefined) {
        typ = typeMap[typ.ref];
    }
    if (Array.isArray(typ)) return transformEnum(typ, val);
    if (typeof typ === "object") {
        return typ.hasOwnProperty("unionMembers") ? transformUnion(typ.unionMembers, val)
            : typ.hasOwnProperty("arrayItems")    ? transformArray(typ.arrayItems, val)
            : typ.hasOwnProperty("props")         ? transformObject(getProps(typ), typ.additional, val)
            : invalidValue(typ, val);
    }
    return transformPrimitive(typ, val);
}

function cast(val, typ) {
    return transform(val, typ, jsonToJSProps);
}

function uncast(val, typ) {
    return transform(val, typ, jsToJSONProps);
}

function a(typ) {
    return { arrayItems: typ };
}

function u(...typs) {
    return { unionMembers: typs };
}

function o(props, additional) {
    return { props, additional };
}

function m(additional) {
    return { props: [], additional };
}

function r(name) {
    return { ref: name };
}

const typeMap = {
    "Reddit": o([
        { json: "kind", js: "kind", typ: "" },
        { json: "data", js: "data", typ: r("RedditData") },
    ], false),
    "RedditData": o([
        { json: "modhash", js: "modhash", typ: "" },
        { json: "dist", js: "dist", typ: 0 },
        { json: "children", js: "children", typ: a(r("Child")) },
        { json: "after", js: "after", typ: "" },
        { json: "before", js: "before", typ: null },
    ], false),
    "Child": o([
        { json: "kind", js: "kind", typ: r("Kind") },
        { json: "data", js: "data", typ: r("ChildData") },
    ], false),
    "ChildData": o([
        { json: "approved_at_utc", js: "approved_at_utc", typ: null },
        { json: "subreddit", js: "subreddit", typ: "" },
        { json: "selftext", js: "selftext", typ: "" },
        { json: "user_reports", js: "user_reports", typ: a("any") },
        { json: "saved", js: "saved", typ: true },
        { json: "mod_reason_title", js: "mod_reason_title", typ: null },
        { json: "gilded", js: "gilded", typ: 0 },
        { json: "clicked", js: "clicked", typ: true },
        { json: "title", js: "title", typ: "" },
        { json: "link_flair_richtext", js: "link_flair_richtext", typ: a(r("LinkFlairRichtext")) },
        { json: "subreddit_name_prefixed", js: "subreddit_name_prefixed", typ: "" },
        { json: "hidden", js: "hidden", typ: true },
        { json: "pwls", js: "pwls", typ: 0 },
        { json: "link_flair_css_class", js: "link_flair_css_class", typ: u(null, "") },
        { json: "downs", js: "downs", typ: 0 },
        { json: "thumbnail_height", js: "thumbnail_height", typ: u(0, null) },
        { json: "parent_whitelist_status", js: "parent_whitelist_status", typ: r("WhitelistStatus") },
        { json: "hide_score", js: "hide_score", typ: true },
        { json: "name", js: "name", typ: "" },
        { json: "quarantine", js: "quarantine", typ: true },
        { json: "link_flair_text_color", js: "link_flair_text_color", typ: r("LinkFlairTextColor") },
        { json: "author_flair_background_color", js: "author_flair_background_color", typ: u(null, "") },
        { json: "subreddit_type", js: "subreddit_type", typ: r("SubredditType") },
        { json: "ups", js: "ups", typ: 0 },
        { json: "domain", js: "domain", typ: "" },
        { json: "media_embed", js: "media_embed", typ: r("MediaEmbed") },
        { json: "thumbnail_width", js: "thumbnail_width", typ: u(0, null) },
        { json: "author_flair_template_id", js: "author_flair_template_id", typ: null },
        { json: "is_original_content", js: "is_original_content", typ: true },
        { json: "secure_media", js: "secure_media", typ: null },
        { json: "is_reddit_media_domain", js: "is_reddit_media_domain", typ: true },
        { json: "is_meta", js: "is_meta", typ: true },
        { json: "category", js: "category", typ: null },
        { json: "secure_media_embed", js: "secure_media_embed", typ: r("MediaEmbed") },
        { json: "link_flair_text", js: "link_flair_text", typ: u(null, "") },
        { json: "can_mod_post", js: "can_mod_post", typ: true },
        { json: "score", js: "score", typ: 0 },
        { json: "approved_by", js: "approved_by", typ: null },
        { json: "thumbnail", js: "thumbnail", typ: "" },
        { json: "edited", js: "edited", typ: u(true, 3.14) },
        { json: "author_flair_css_class", js: "author_flair_css_class", typ: u(null, "") },
        { json: "author_flair_richtext", js: "author_flair_richtext", typ: a(r("AuthorFlairRichtext")) },
        { json: "post_hint", js: "post_hint", typ: u(undefined, r("PostHint")) },
        { json: "content_categories", js: "content_categories", typ: u(a(""), null) },
        { json: "is_self", js: "is_self", typ: true },
        { json: "mod_note", js: "mod_note", typ: null },
        { json: "created", js: "created", typ: 3.14 },
        { json: "link_flair_type", js: "link_flair_type", typ: r("FlairType") },
        { json: "wls", js: "wls", typ: 0 },
        { json: "banned_by", js: "banned_by", typ: null },
        { json: "author_flair_type", js: "author_flair_type", typ: r("FlairType") },
        { json: "contest_mode", js: "contest_mode", typ: true },
        { json: "selftext_html", js: "selftext_html", typ: u(null, "") },
        { json: "likes", js: "likes", typ: null },
        { json: "suggested_sort", js: "suggested_sort", typ: u(null, "") },
        { json: "banned_at_utc", js: "banned_at_utc", typ: null },
        { json: "view_count", js: "view_count", typ: null },
        { json: "archived", js: "archived", typ: true },
        { json: "no_follow", js: "no_follow", typ: true },
        { json: "is_crosspostable", js: "is_crosspostable", typ: true },
        { json: "pinned", js: "pinned", typ: true },
        { json: "over_18", js: "over_18", typ: true },
        { json: "preview", js: "preview", typ: u(undefined, r("Preview")) },
        { json: "media_only", js: "media_only", typ: true },
        { json: "link_flair_template_id", js: "link_flair_template_id", typ: u(null, "") },
        { json: "can_gild", js: "can_gild", typ: true },
        { json: "spoiler", js: "spoiler", typ: true },
        { json: "locked", js: "locked", typ: true },
        { json: "author_flair_text", js: "author_flair_text", typ: u(null, "") },
        { json: "visited", js: "visited", typ: true },
        { json: "num_reports", js: "num_reports", typ: null },
        { json: "distinguished", js: "distinguished", typ: null },
        { json: "subreddit_id", js: "subreddit_id", typ: "" },
        { json: "mod_reason_by", js: "mod_reason_by", typ: null },
        { json: "removal_reason", js: "removal_reason", typ: null },
        { json: "link_flair_background_color", js: "link_flair_background_color", typ: r("LinkFlairBackgroundColor") },
        { json: "id", js: "id", typ: "" },
        { json: "report_reasons", js: "report_reasons", typ: null },
        { json: "author", js: "author", typ: "" },
        { json: "num_crossposts", js: "num_crossposts", typ: 0 },
        { json: "num_comments", js: "num_comments", typ: 0 },
        { json: "send_replies", js: "send_replies", typ: true },
        { json: "mod_reports", js: "mod_reports", typ: a("any") },
        { json: "author_flair_text_color", js: "author_flair_text_color", typ: u(null, "") },
        { json: "permalink", js: "permalink", typ: "" },
        { json: "whitelist_status", js: "whitelist_status", typ: r("WhitelistStatus") },
        { json: "stickied", js: "stickied", typ: true },
        { json: "url", js: "url", typ: "" },
        { json: "subreddit_subscribers", js: "subreddit_subscribers", typ: 0 },
        { json: "created_utc", js: "created_utc", typ: 3.14 },
        { json: "media", js: "media", typ: null },
        { json: "is_video", js: "is_video", typ: true },
    ], false),
    "AuthorFlairRichtext": o([
        { json: "e", js: "e", typ: "" },
        { json: "t", js: "t", typ: "" },
    ], false),
    "LinkFlairRichtext": o([
        { json: "e", js: "e", typ: "" },
        { json: "t", js: "t", typ: u(undefined, "") },
        { json: "a", js: "a", typ: u(undefined, "") },
        { json: "u", js: "u", typ: u(undefined, "") },
    ], false),
    "MediaEmbed": o([
    ], false),
    "Preview": o([
        { json: "images", js: "images", typ: a(r("Image")) },
        { json: "enabled", js: "enabled", typ: true },
        { json: "reddit_video_preview", js: "reddit_video_preview", typ: u(undefined, r("RedditVideoPreview")) },
    ], false),
    "Image": o([
        { json: "source", js: "source", typ: r("Source") },
        { json: "resolutions", js: "resolutions", typ: a(r("Source")) },
        { json: "variants", js: "variants", typ: r("Variants") },
        { json: "id", js: "id", typ: "" },
    ], false),
    "Source": o([
        { json: "url", js: "url", typ: "" },
        { json: "width", js: "width", typ: 0 },
        { json: "height", js: "height", typ: 0 },
    ], false),
    "Variants": o([
        { json: "gif", js: "gif", typ: u(undefined, r("GIF")) },
        { json: "mp4", js: "mp4", typ: u(undefined, r("GIF")) },
    ], false),
    "GIF": o([
        { json: "source", js: "source", typ: r("Source") },
        { json: "resolutions", js: "resolutions", typ: a(r("Source")) },
    ], false),
    "RedditVideoPreview": o([
        { json: "fallback_url", js: "fallback_url", typ: "" },
        { json: "height", js: "height", typ: 0 },
        { json: "width", js: "width", typ: 0 },
        { json: "scrubber_media_url", js: "scrubber_media_url", typ: "" },
        { json: "dash_url", js: "dash_url", typ: "" },
        { json: "duration", js: "duration", typ: 0 },
        { json: "hls_url", js: "hls_url", typ: "" },
        { json: "is_gif", js: "is_gif", typ: true },
        { json: "transcoding_status", js: "transcoding_status", typ: "" },
    ], false),
    "FlairType": [
        "richtext",
        "text",
    ],
    "LinkFlairBackgroundColor": [
        "",
        "#ff4500",
        "#6289d1",
    ],
    "LinkFlairTextColor": [
        "dark",
        "light",
    ],
    "WhitelistStatus": [
        "all_ads",
        "house_only",
        "promo_all",
    ],
    "PostHint": [
        "image",
        "link",
        "self",
    ],
    "SubredditType": [
        "public",
    ],
    "Kind": [
        "t3",
    ],
};

module.exports = {
    "redditToJson": redditToJson,
    "toReddit": toReddit,
};
