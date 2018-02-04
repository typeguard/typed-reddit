-- To decode the JSON data, add this file to your project, run
--
--     elm-package install NoRedInk/elm-decode-pipeline
--
-- add these imports
--
--     import Json.Decode exposing (decodeString)`);
--     import QuickType exposing (reddit)
--
-- and you're off to the races with
--
--     decodeString reddit myJsonString

module QuickType exposing
    ( Reddit
    , redditToString
    , reddit
    , RedditData
    , Child
    , ChildData
    , Media
    , Oembed
    , MediaEmbed
    , Preview
    , PreviewImage
    , Resolution
    , Variants
    , GIF
    , ProviderName(..)
    , ProviderURL(..)
    , OembedType(..)
    , Version(..)
    , MediaType(..)
    , WhitelistStatus(..)
    , PostHint(..)
    , SubredditType(..)
    , Kind(..)
    )

import Json.Decode as Jdec
import Json.Decode.Pipeline as Jpipe
import Json.Encode as Jenc
import Dict exposing (Dict, map, toList)
import Array exposing (Array, map)

type alias Reddit =
    { kind : String
    , data : RedditData
    }

type alias RedditData =
    { after : String
    , dist : Int
    , modhash : String
    , whitelistStatus : String
    , children : Array Child
    , before : ()
    }

type alias Child =
    { kind : Kind
    , data : ChildData
    }

type alias ChildData =
    { domain : String
    , approvedAtUTC : ()
    , modReasonBy : ()
    , bannedBy : ()
    , numReports : ()
    , subredditID : String
    , thumbnailWidth : Maybe Int
    , subreddit : String
    , selftextHTML : Maybe String
    , selftext : String
    , likes : ()
    , suggestedSort : Maybe String
    , userReports : Array Jdec.Value
    , secureMedia : Maybe Media
    , isRedditMediaDomain : Bool
    , linkFlairText : Maybe String
    , id : String
    , bannedAtUTC : ()
    , modReasonTitle : ()
    , viewCount : ()
    , archived : Bool
    , clicked : Bool
    , mediaEmbed : MediaEmbed
    , reportReasons : ()
    , author : String
    , numCrossposts : Int
    , saved : Bool
    , modReports : Array Jdec.Value
    , canModPost : Bool
    , isCrosspostable : Bool
    , pinned : Bool
    , score : Int
    , approvedBy : ()
    , over18 : Bool
    , hidden : Bool
    , preview : Preview
    , thumbnail : String
    , edited : Bool
    , linkFlairCSSClass : Maybe String
    , authorFlairCSSClass : Maybe String
    , contestMode : Bool
    , gilded : Int
    , downs : Int
    , brandSafe : Bool
    , secureMediaEmbed : MediaEmbed
    , removalReason : ()
    , postHint : PostHint
    , authorFlairText : Maybe String
    , stickied : Bool
    , canGild : Bool
    , thumbnailHeight : Maybe Int
    , parentWhitelistStatus : WhitelistStatus
    , name : String
    , spoiler : Bool
    , permalink : String
    , subredditType : SubredditType
    , locked : Bool
    , hideScore : Bool
    , created : Float
    , url : String
    , whitelistStatus : WhitelistStatus
    , quarantine : Bool
    , title : String
    , createdUTC : Float
    , subredditNamePrefixed : String
    , ups : Int
    , media : Maybe Media
    , numComments : Int
    , isSelf : Bool
    , visited : Bool
    , modNote : ()
    , isVideo : Bool
    , distinguished : ()
    }

type alias Media =
    { purpleType : MediaType
    , oembed : Oembed
    }

type alias Oembed =
    { providerURL : ProviderURL
    , description : Maybe String
    , title : String
    , thumbnailWidth : Int
    , height : Int
    , width : Int
    , html : String
    , version : Version
    , providerName : ProviderName
    , thumbnailURL : String
    , purpleType : OembedType
    , thumbnailHeight : Int
    , authorName : Maybe String
    , authorURL : Maybe String
    }

type ProviderName
    = Clippit
    | Gfycat
    | YouTube

type ProviderURL
    = HTTPClippitTv
    | HTTPGfycatCOM
    | HTTPSWWWYoutubeCOM

type OembedType
    = Video

type Version
    = The10

type MediaType
    = ClippituserTv
    | GfycatCOM
    | YoutubeCOM

type alias MediaEmbed =
    { content : Maybe String
    , width : Maybe Int
    , scrolling : Maybe Bool
    , height : Maybe Int
    , mediaDomainURL : Maybe String
    }

type WhitelistStatus
    = AllAds
    | PromoAll

type PostHint
    = Link
    | PostHintImage
    | RichVideo
    | Self

type alias Preview =
    { images : Array PreviewImage
    , enabled : Bool
    }

type alias PreviewImage =
    { source : Resolution
    , resolutions : Array Resolution
    , variants : Variants
    , id : String
    }

type alias Resolution =
    { url : String
    , width : Int
    , height : Int
    }

type alias Variants =
    { gif : Maybe GIF
    , mp4 : Maybe GIF
    }

type alias GIF =
    { source : Resolution
    , resolutions : Array Resolution
    }

type SubredditType
    = Public

type Kind
    = T3

-- decoders and encoders

redditToString : Reddit -> String
redditToString r = Jenc.encode 0 (encodeReddit r)

reddit : Jdec.Decoder Reddit
reddit =
    Jpipe.decode Reddit
        |> Jpipe.required "kind" Jdec.string
        |> Jpipe.required "data" redditData

encodeReddit : Reddit -> Jenc.Value
encodeReddit x =
    Jenc.object
        [ ("kind", Jenc.string x.kind)
        , ("data", encodeRedditData x.data)
        ]

redditData : Jdec.Decoder RedditData
redditData =
    Jpipe.decode RedditData
        |> Jpipe.required "after" Jdec.string
        |> Jpipe.required "dist" Jdec.int
        |> Jpipe.required "modhash" Jdec.string
        |> Jpipe.required "whitelist_status" Jdec.string
        |> Jpipe.required "children" (Jdec.array child)
        |> Jpipe.optional "before" (Jdec.null ()) ()

encodeRedditData : RedditData -> Jenc.Value
encodeRedditData x =
    Jenc.object
        [ ("after", Jenc.string x.after)
        , ("dist", Jenc.int x.dist)
        , ("modhash", Jenc.string x.modhash)
        , ("whitelist_status", Jenc.string x.whitelistStatus)
        , ("children", makeArrayEncoder encodeChild x.children)
        , ("before", always Jenc.null x.before)
        ]

child : Jdec.Decoder Child
child =
    Jpipe.decode Child
        |> Jpipe.required "kind" kind
        |> Jpipe.required "data" childData

encodeChild : Child -> Jenc.Value
encodeChild x =
    Jenc.object
        [ ("kind", encodeKind x.kind)
        , ("data", encodeChildData x.data)
        ]

childData : Jdec.Decoder ChildData
childData =
    Jpipe.decode ChildData
        |> Jpipe.required "domain" Jdec.string
        |> Jpipe.optional "approved_at_utc" (Jdec.null ()) ()
        |> Jpipe.optional "mod_reason_by" (Jdec.null ()) ()
        |> Jpipe.optional "banned_by" (Jdec.null ()) ()
        |> Jpipe.optional "num_reports" (Jdec.null ()) ()
        |> Jpipe.required "subreddit_id" Jdec.string
        |> Jpipe.optional "thumbnail_width" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.required "subreddit" Jdec.string
        |> Jpipe.optional "selftext_html" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "selftext" Jdec.string
        |> Jpipe.optional "likes" (Jdec.null ()) ()
        |> Jpipe.optional "suggested_sort" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "user_reports" (Jdec.array Jdec.value)
        |> Jpipe.optional "secure_media" (Jdec.nullable media) Nothing
        |> Jpipe.required "is_reddit_media_domain" Jdec.bool
        |> Jpipe.optional "link_flair_text" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.optional "banned_at_utc" (Jdec.null ()) ()
        |> Jpipe.optional "mod_reason_title" (Jdec.null ()) ()
        |> Jpipe.optional "view_count" (Jdec.null ()) ()
        |> Jpipe.required "archived" Jdec.bool
        |> Jpipe.required "clicked" Jdec.bool
        |> Jpipe.required "media_embed" mediaEmbed
        |> Jpipe.optional "report_reasons" (Jdec.null ()) ()
        |> Jpipe.required "author" Jdec.string
        |> Jpipe.required "num_crossposts" Jdec.int
        |> Jpipe.required "saved" Jdec.bool
        |> Jpipe.required "mod_reports" (Jdec.array Jdec.value)
        |> Jpipe.required "can_mod_post" Jdec.bool
        |> Jpipe.required "is_crosspostable" Jdec.bool
        |> Jpipe.required "pinned" Jdec.bool
        |> Jpipe.required "score" Jdec.int
        |> Jpipe.optional "approved_by" (Jdec.null ()) ()
        |> Jpipe.required "over_18" Jdec.bool
        |> Jpipe.required "hidden" Jdec.bool
        |> Jpipe.required "preview" preview
        |> Jpipe.required "thumbnail" Jdec.string
        |> Jpipe.required "edited" Jdec.bool
        |> Jpipe.optional "link_flair_css_class" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "author_flair_css_class" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "contest_mode" Jdec.bool
        |> Jpipe.required "gilded" Jdec.int
        |> Jpipe.required "downs" Jdec.int
        |> Jpipe.required "brand_safe" Jdec.bool
        |> Jpipe.required "secure_media_embed" mediaEmbed
        |> Jpipe.optional "removal_reason" (Jdec.null ()) ()
        |> Jpipe.required "post_hint" postHint
        |> Jpipe.optional "author_flair_text" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "stickied" Jdec.bool
        |> Jpipe.required "can_gild" Jdec.bool
        |> Jpipe.optional "thumbnail_height" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.required "parent_whitelist_status" whitelistStatus
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.required "spoiler" Jdec.bool
        |> Jpipe.required "permalink" Jdec.string
        |> Jpipe.required "subreddit_type" subredditType
        |> Jpipe.required "locked" Jdec.bool
        |> Jpipe.required "hide_score" Jdec.bool
        |> Jpipe.required "created" Jdec.float
        |> Jpipe.required "url" Jdec.string
        |> Jpipe.required "whitelist_status" whitelistStatus
        |> Jpipe.required "quarantine" Jdec.bool
        |> Jpipe.required "title" Jdec.string
        |> Jpipe.required "created_utc" Jdec.float
        |> Jpipe.required "subreddit_name_prefixed" Jdec.string
        |> Jpipe.required "ups" Jdec.int
        |> Jpipe.optional "media" (Jdec.nullable media) Nothing
        |> Jpipe.required "num_comments" Jdec.int
        |> Jpipe.required "is_self" Jdec.bool
        |> Jpipe.required "visited" Jdec.bool
        |> Jpipe.optional "mod_note" (Jdec.null ()) ()
        |> Jpipe.required "is_video" Jdec.bool
        |> Jpipe.optional "distinguished" (Jdec.null ()) ()

encodeChildData : ChildData -> Jenc.Value
encodeChildData x =
    Jenc.object
        [ ("domain", Jenc.string x.domain)
        , ("approved_at_utc", always Jenc.null x.approvedAtUTC)
        , ("mod_reason_by", always Jenc.null x.modReasonBy)
        , ("banned_by", always Jenc.null x.bannedBy)
        , ("num_reports", always Jenc.null x.numReports)
        , ("subreddit_id", Jenc.string x.subredditID)
        , ("thumbnail_width", makeNullableEncoder Jenc.int x.thumbnailWidth)
        , ("subreddit", Jenc.string x.subreddit)
        , ("selftext_html", makeNullableEncoder Jenc.string x.selftextHTML)
        , ("selftext", Jenc.string x.selftext)
        , ("likes", always Jenc.null x.likes)
        , ("suggested_sort", makeNullableEncoder Jenc.string x.suggestedSort)
        , ("user_reports", makeArrayEncoder identity x.userReports)
        , ("secure_media", makeNullableEncoder encodeMedia x.secureMedia)
        , ("is_reddit_media_domain", Jenc.bool x.isRedditMediaDomain)
        , ("link_flair_text", makeNullableEncoder Jenc.string x.linkFlairText)
        , ("id", Jenc.string x.id)
        , ("banned_at_utc", always Jenc.null x.bannedAtUTC)
        , ("mod_reason_title", always Jenc.null x.modReasonTitle)
        , ("view_count", always Jenc.null x.viewCount)
        , ("archived", Jenc.bool x.archived)
        , ("clicked", Jenc.bool x.clicked)
        , ("media_embed", encodeMediaEmbed x.mediaEmbed)
        , ("report_reasons", always Jenc.null x.reportReasons)
        , ("author", Jenc.string x.author)
        , ("num_crossposts", Jenc.int x.numCrossposts)
        , ("saved", Jenc.bool x.saved)
        , ("mod_reports", makeArrayEncoder identity x.modReports)
        , ("can_mod_post", Jenc.bool x.canModPost)
        , ("is_crosspostable", Jenc.bool x.isCrosspostable)
        , ("pinned", Jenc.bool x.pinned)
        , ("score", Jenc.int x.score)
        , ("approved_by", always Jenc.null x.approvedBy)
        , ("over_18", Jenc.bool x.over18)
        , ("hidden", Jenc.bool x.hidden)
        , ("preview", encodePreview x.preview)
        , ("thumbnail", Jenc.string x.thumbnail)
        , ("edited", Jenc.bool x.edited)
        , ("link_flair_css_class", makeNullableEncoder Jenc.string x.linkFlairCSSClass)
        , ("author_flair_css_class", makeNullableEncoder Jenc.string x.authorFlairCSSClass)
        , ("contest_mode", Jenc.bool x.contestMode)
        , ("gilded", Jenc.int x.gilded)
        , ("downs", Jenc.int x.downs)
        , ("brand_safe", Jenc.bool x.brandSafe)
        , ("secure_media_embed", encodeMediaEmbed x.secureMediaEmbed)
        , ("removal_reason", always Jenc.null x.removalReason)
        , ("post_hint", encodePostHint x.postHint)
        , ("author_flair_text", makeNullableEncoder Jenc.string x.authorFlairText)
        , ("stickied", Jenc.bool x.stickied)
        , ("can_gild", Jenc.bool x.canGild)
        , ("thumbnail_height", makeNullableEncoder Jenc.int x.thumbnailHeight)
        , ("parent_whitelist_status", encodeWhitelistStatus x.parentWhitelistStatus)
        , ("name", Jenc.string x.name)
        , ("spoiler", Jenc.bool x.spoiler)
        , ("permalink", Jenc.string x.permalink)
        , ("subreddit_type", encodeSubredditType x.subredditType)
        , ("locked", Jenc.bool x.locked)
        , ("hide_score", Jenc.bool x.hideScore)
        , ("created", Jenc.float x.created)
        , ("url", Jenc.string x.url)
        , ("whitelist_status", encodeWhitelistStatus x.whitelistStatus)
        , ("quarantine", Jenc.bool x.quarantine)
        , ("title", Jenc.string x.title)
        , ("created_utc", Jenc.float x.createdUTC)
        , ("subreddit_name_prefixed", Jenc.string x.subredditNamePrefixed)
        , ("ups", Jenc.int x.ups)
        , ("media", makeNullableEncoder encodeMedia x.media)
        , ("num_comments", Jenc.int x.numComments)
        , ("is_self", Jenc.bool x.isSelf)
        , ("visited", Jenc.bool x.visited)
        , ("mod_note", always Jenc.null x.modNote)
        , ("is_video", Jenc.bool x.isVideo)
        , ("distinguished", always Jenc.null x.distinguished)
        ]

media : Jdec.Decoder Media
media =
    Jpipe.decode Media
        |> Jpipe.required "type" mediaType
        |> Jpipe.required "oembed" oembed

encodeMedia : Media -> Jenc.Value
encodeMedia x =
    Jenc.object
        [ ("type", encodeMediaType x.purpleType)
        , ("oembed", encodeOembed x.oembed)
        ]

oembed : Jdec.Decoder Oembed
oembed =
    Jpipe.decode Oembed
        |> Jpipe.required "provider_url" providerURL
        |> Jpipe.optional "description" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "title" Jdec.string
        |> Jpipe.required "thumbnail_width" Jdec.int
        |> Jpipe.required "height" Jdec.int
        |> Jpipe.required "width" Jdec.int
        |> Jpipe.required "html" Jdec.string
        |> Jpipe.required "version" version
        |> Jpipe.required "provider_name" providerName
        |> Jpipe.required "thumbnail_url" Jdec.string
        |> Jpipe.required "type" oembedType
        |> Jpipe.required "thumbnail_height" Jdec.int
        |> Jpipe.optional "author_name" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "author_url" (Jdec.nullable Jdec.string) Nothing

encodeOembed : Oembed -> Jenc.Value
encodeOembed x =
    Jenc.object
        [ ("provider_url", encodeProviderURL x.providerURL)
        , ("description", makeNullableEncoder Jenc.string x.description)
        , ("title", Jenc.string x.title)
        , ("thumbnail_width", Jenc.int x.thumbnailWidth)
        , ("height", Jenc.int x.height)
        , ("width", Jenc.int x.width)
        , ("html", Jenc.string x.html)
        , ("version", encodeVersion x.version)
        , ("provider_name", encodeProviderName x.providerName)
        , ("thumbnail_url", Jenc.string x.thumbnailURL)
        , ("type", encodeOembedType x.purpleType)
        , ("thumbnail_height", Jenc.int x.thumbnailHeight)
        , ("author_name", makeNullableEncoder Jenc.string x.authorName)
        , ("author_url", makeNullableEncoder Jenc.string x.authorURL)
        ]

providerName : Jdec.Decoder ProviderName
providerName =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "Clippit" -> Jdec.succeed Clippit
                "gfycat" -> Jdec.succeed Gfycat
                "YouTube" -> Jdec.succeed YouTube
                somethingElse -> Jdec.fail <| "Invalid ProviderName: " ++ somethingElse
        )

encodeProviderName : ProviderName -> Jenc.Value
encodeProviderName x = case x of
    Clippit -> Jenc.string "Clippit"
    Gfycat -> Jenc.string "gfycat"
    YouTube -> Jenc.string "YouTube"

providerURL : Jdec.Decoder ProviderURL
providerURL =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "http://clippit.tv" -> Jdec.succeed HTTPClippitTv
                "http://gfycat.com" -> Jdec.succeed HTTPGfycatCOM
                "https://www.youtube.com/" -> Jdec.succeed HTTPSWWWYoutubeCOM
                somethingElse -> Jdec.fail <| "Invalid ProviderURL: " ++ somethingElse
        )

encodeProviderURL : ProviderURL -> Jenc.Value
encodeProviderURL x = case x of
    HTTPClippitTv -> Jenc.string "http://clippit.tv"
    HTTPGfycatCOM -> Jenc.string "http://gfycat.com"
    HTTPSWWWYoutubeCOM -> Jenc.string "https://www.youtube.com/"

oembedType : Jdec.Decoder OembedType
oembedType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "video" -> Jdec.succeed Video
                somethingElse -> Jdec.fail <| "Invalid OembedType: " ++ somethingElse
        )

encodeOembedType : OembedType -> Jenc.Value
encodeOembedType x = case x of
    Video -> Jenc.string "video"

version : Jdec.Decoder Version
version =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "1.0" -> Jdec.succeed The10
                somethingElse -> Jdec.fail <| "Invalid Version: " ++ somethingElse
        )

encodeVersion : Version -> Jenc.Value
encodeVersion x = case x of
    The10 -> Jenc.string "1.0"

mediaType : Jdec.Decoder MediaType
mediaType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "clippituser.tv" -> Jdec.succeed ClippituserTv
                "gfycat.com" -> Jdec.succeed GfycatCOM
                "youtube.com" -> Jdec.succeed YoutubeCOM
                somethingElse -> Jdec.fail <| "Invalid MediaType: " ++ somethingElse
        )

encodeMediaType : MediaType -> Jenc.Value
encodeMediaType x = case x of
    ClippituserTv -> Jenc.string "clippituser.tv"
    GfycatCOM -> Jenc.string "gfycat.com"
    YoutubeCOM -> Jenc.string "youtube.com"

mediaEmbed : Jdec.Decoder MediaEmbed
mediaEmbed =
    Jpipe.decode MediaEmbed
        |> Jpipe.optional "content" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "width" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.optional "scrolling" (Jdec.nullable Jdec.bool) Nothing
        |> Jpipe.optional "height" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.optional "media_domain_url" (Jdec.nullable Jdec.string) Nothing

encodeMediaEmbed : MediaEmbed -> Jenc.Value
encodeMediaEmbed x =
    Jenc.object
        [ ("content", makeNullableEncoder Jenc.string x.content)
        , ("width", makeNullableEncoder Jenc.int x.width)
        , ("scrolling", makeNullableEncoder Jenc.bool x.scrolling)
        , ("height", makeNullableEncoder Jenc.int x.height)
        , ("media_domain_url", makeNullableEncoder Jenc.string x.mediaDomainURL)
        ]

whitelistStatus : Jdec.Decoder WhitelistStatus
whitelistStatus =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "all_ads" -> Jdec.succeed AllAds
                "promo_all" -> Jdec.succeed PromoAll
                somethingElse -> Jdec.fail <| "Invalid WhitelistStatus: " ++ somethingElse
        )

encodeWhitelistStatus : WhitelistStatus -> Jenc.Value
encodeWhitelistStatus x = case x of
    AllAds -> Jenc.string "all_ads"
    PromoAll -> Jenc.string "promo_all"

postHint : Jdec.Decoder PostHint
postHint =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "link" -> Jdec.succeed Link
                "image" -> Jdec.succeed PostHintImage
                "rich:video" -> Jdec.succeed RichVideo
                "self" -> Jdec.succeed Self
                somethingElse -> Jdec.fail <| "Invalid PostHint: " ++ somethingElse
        )

encodePostHint : PostHint -> Jenc.Value
encodePostHint x = case x of
    Link -> Jenc.string "link"
    PostHintImage -> Jenc.string "image"
    RichVideo -> Jenc.string "rich:video"
    Self -> Jenc.string "self"

preview : Jdec.Decoder Preview
preview =
    Jpipe.decode Preview
        |> Jpipe.required "images" (Jdec.array previewImage)
        |> Jpipe.required "enabled" Jdec.bool

encodePreview : Preview -> Jenc.Value
encodePreview x =
    Jenc.object
        [ ("images", makeArrayEncoder encodePreviewImage x.images)
        , ("enabled", Jenc.bool x.enabled)
        ]

previewImage : Jdec.Decoder PreviewImage
previewImage =
    Jpipe.decode PreviewImage
        |> Jpipe.required "source" resolution
        |> Jpipe.required "resolutions" (Jdec.array resolution)
        |> Jpipe.required "variants" variants
        |> Jpipe.required "id" Jdec.string

encodePreviewImage : PreviewImage -> Jenc.Value
encodePreviewImage x =
    Jenc.object
        [ ("source", encodeResolution x.source)
        , ("resolutions", makeArrayEncoder encodeResolution x.resolutions)
        , ("variants", encodeVariants x.variants)
        , ("id", Jenc.string x.id)
        ]

resolution : Jdec.Decoder Resolution
resolution =
    Jpipe.decode Resolution
        |> Jpipe.required "url" Jdec.string
        |> Jpipe.required "width" Jdec.int
        |> Jpipe.required "height" Jdec.int

encodeResolution : Resolution -> Jenc.Value
encodeResolution x =
    Jenc.object
        [ ("url", Jenc.string x.url)
        , ("width", Jenc.int x.width)
        , ("height", Jenc.int x.height)
        ]

variants : Jdec.Decoder Variants
variants =
    Jpipe.decode Variants
        |> Jpipe.optional "gif" (Jdec.nullable gif) Nothing
        |> Jpipe.optional "mp4" (Jdec.nullable gif) Nothing

encodeVariants : Variants -> Jenc.Value
encodeVariants x =
    Jenc.object
        [ ("gif", makeNullableEncoder encodeGIF x.gif)
        , ("mp4", makeNullableEncoder encodeGIF x.mp4)
        ]

gif : Jdec.Decoder GIF
gif =
    Jpipe.decode GIF
        |> Jpipe.required "source" resolution
        |> Jpipe.required "resolutions" (Jdec.array resolution)

encodeGIF : GIF -> Jenc.Value
encodeGIF x =
    Jenc.object
        [ ("source", encodeResolution x.source)
        , ("resolutions", makeArrayEncoder encodeResolution x.resolutions)
        ]

subredditType : Jdec.Decoder SubredditType
subredditType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "public" -> Jdec.succeed Public
                somethingElse -> Jdec.fail <| "Invalid SubredditType: " ++ somethingElse
        )

encodeSubredditType : SubredditType -> Jenc.Value
encodeSubredditType x = case x of
    Public -> Jenc.string "public"

kind : Jdec.Decoder Kind
kind =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "t3" -> Jdec.succeed T3
                somethingElse -> Jdec.fail <| "Invalid Kind: " ++ somethingElse
        )

encodeKind : Kind -> Jenc.Value
encodeKind x = case x of
    T3 -> Jenc.string "t3"

--- encoder helpers

makeArrayEncoder : (a -> Jenc.Value) -> Array a -> Jenc.Value
makeArrayEncoder f arr =
    Jenc.array (Array.map f arr)

makeDictEncoder : (a -> Jenc.Value) -> Dict String a -> Jenc.Value
makeDictEncoder f dict =
    Jenc.object (toList (Dict.map (\k -> f) dict))

makeNullableEncoder : (a -> Jenc.Value) -> Maybe a -> Jenc.Value
makeNullableEncoder f m =
    case m of
    Just x -> f x
    Nothing -> Jenc.null
