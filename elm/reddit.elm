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
    , AuthorFlairRichtext
    , LinkFlairRichtext
    , MediaEmbed
    , Preview
    , ImageElement
    , Source
    , Variants
    , GIF
    , RedditVideoPreview
    , FlairType(..)
    , LinkFlairBackgroundColor(..)
    , LinkFlairTextColor(..)
    , WhitelistStatus(..)
    , PostHint(..)
    , SubredditType(..)
    , Kind(..)
    , Edited(..)
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
    { modhash : String
    , dist : Int
    , children : Array Child
    , after : String
    , before : ()
    }

type alias Child =
    { kind : Kind
    , data : ChildData
    }

type alias ChildData =
    { approvedAtUTC : ()
    , subreddit : String
    , selftext : String
    , userReports : Array Jdec.Value
    , saved : Bool
    , modReasonTitle : ()
    , gilded : Int
    , clicked : Bool
    , title : String
    , linkFlairRichtext : Array LinkFlairRichtext
    , subredditNamePrefixed : String
    , hidden : Bool
    , pwls : Int
    , linkFlairCSSClass : Maybe String
    , downs : Int
    , thumbnailHeight : Maybe Int
    , parentWhitelistStatus : WhitelistStatus
    , hideScore : Bool
    , name : String
    , quarantine : Bool
    , linkFlairTextColor : LinkFlairTextColor
    , authorFlairBackgroundColor : Maybe String
    , subredditType : SubredditType
    , ups : Int
    , domain : String
    , mediaEmbed : MediaEmbed
    , thumbnailWidth : Maybe Int
    , authorFlairTemplateID : ()
    , isOriginalContent : Bool
    , secureMedia : ()
    , isRedditMediaDomain : Bool
    , isMeta : Bool
    , category : ()
    , secureMediaEmbed : MediaEmbed
    , linkFlairText : Maybe String
    , canModPost : Bool
    , score : Int
    , approvedBy : ()
    , thumbnail : String
    , edited : Edited
    , authorFlairCSSClass : Maybe String
    , authorFlairRichtext : Array AuthorFlairRichtext
    , postHint : Maybe PostHint
    , contentCategories : Maybe (Array String)
    , isSelf : Bool
    , modNote : ()
    , created : Float
    , linkFlairType : FlairType
    , wls : Int
    , bannedBy : ()
    , authorFlairType : FlairType
    , contestMode : Bool
    , selftextHTML : Maybe String
    , likes : ()
    , suggestedSort : Maybe String
    , bannedAtUTC : ()
    , viewCount : ()
    , archived : Bool
    , noFollow : Bool
    , isCrosspostable : Bool
    , pinned : Bool
    , over18 : Bool
    , preview : Maybe Preview
    , mediaOnly : Bool
    , linkFlairTemplateID : Maybe String
    , canGild : Bool
    , spoiler : Bool
    , locked : Bool
    , authorFlairText : Maybe String
    , visited : Bool
    , numReports : ()
    , distinguished : ()
    , subredditID : String
    , modReasonBy : ()
    , removalReason : ()
    , linkFlairBackgroundColor : LinkFlairBackgroundColor
    , id : String
    , reportReasons : ()
    , author : String
    , numCrossposts : Int
    , numComments : Int
    , sendReplies : Bool
    , modReports : Array Jdec.Value
    , authorFlairTextColor : Maybe String
    , permalink : String
    , whitelistStatus : WhitelistStatus
    , stickied : Bool
    , url : String
    , subredditSubscribers : Int
    , createdUTC : Float
    , media : ()
    , isVideo : Bool
    }

type alias AuthorFlairRichtext =
    { e : String
    , t : String
    }

type FlairType
    = Richtext
    | Text

type Edited
    = BoolInEdited Bool
    | DoubleInEdited Float

type LinkFlairBackgroundColor
    = Empty
    | Ff4500
    | The6289D1

type alias LinkFlairRichtext =
    { e : String
    , t : Maybe String
    , a : Maybe String
    , u : Maybe String
    }

type LinkFlairTextColor
    = Dark
    | Light

type alias MediaEmbed =
    {
    }

type WhitelistStatus
    = AllAds
    | HouseOnly
    | PromoAll

type PostHint
    = Image
    | Link
    | Self

type alias Preview =
    { images : Array ImageElement
    , enabled : Bool
    , redditVideoPreview : Maybe RedditVideoPreview
    }

type alias ImageElement =
    { source : Source
    , resolutions : Array Source
    , variants : Variants
    , id : String
    }

type alias Source =
    { url : String
    , width : Int
    , height : Int
    }

type alias Variants =
    { gif : Maybe GIF
    , mp4 : Maybe GIF
    }

type alias GIF =
    { source : Source
    , resolutions : Array Source
    }

type alias RedditVideoPreview =
    { fallbackURL : String
    , height : Int
    , width : Int
    , scrubberMediaURL : String
    , dashURL : String
    , duration : Int
    , hlsURL : String
    , isGIF : Bool
    , transcodingStatus : String
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
        |> Jpipe.required "modhash" Jdec.string
        |> Jpipe.required "dist" Jdec.int
        |> Jpipe.required "children" (Jdec.array child)
        |> Jpipe.required "after" Jdec.string
        |> Jpipe.optional "before" (Jdec.null ()) ()

encodeRedditData : RedditData -> Jenc.Value
encodeRedditData x =
    Jenc.object
        [ ("modhash", Jenc.string x.modhash)
        , ("dist", Jenc.int x.dist)
        , ("children", makeArrayEncoder encodeChild x.children)
        , ("after", Jenc.string x.after)
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
        |> Jpipe.optional "approved_at_utc" (Jdec.null ()) ()
        |> Jpipe.required "subreddit" Jdec.string
        |> Jpipe.required "selftext" Jdec.string
        |> Jpipe.required "user_reports" (Jdec.array Jdec.value)
        |> Jpipe.required "saved" Jdec.bool
        |> Jpipe.optional "mod_reason_title" (Jdec.null ()) ()
        |> Jpipe.required "gilded" Jdec.int
        |> Jpipe.required "clicked" Jdec.bool
        |> Jpipe.required "title" Jdec.string
        |> Jpipe.required "link_flair_richtext" (Jdec.array linkFlairRichtext)
        |> Jpipe.required "subreddit_name_prefixed" Jdec.string
        |> Jpipe.required "hidden" Jdec.bool
        |> Jpipe.required "pwls" Jdec.int
        |> Jpipe.optional "link_flair_css_class" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "downs" Jdec.int
        |> Jpipe.optional "thumbnail_height" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.required "parent_whitelist_status" whitelistStatus
        |> Jpipe.required "hide_score" Jdec.bool
        |> Jpipe.required "name" Jdec.string
        |> Jpipe.required "quarantine" Jdec.bool
        |> Jpipe.required "link_flair_text_color" linkFlairTextColor
        |> Jpipe.optional "author_flair_background_color" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "subreddit_type" subredditType
        |> Jpipe.required "ups" Jdec.int
        |> Jpipe.required "domain" Jdec.string
        |> Jpipe.required "media_embed" mediaEmbed
        |> Jpipe.optional "thumbnail_width" (Jdec.nullable Jdec.int) Nothing
        |> Jpipe.optional "author_flair_template_id" (Jdec.null ()) ()
        |> Jpipe.required "is_original_content" Jdec.bool
        |> Jpipe.optional "secure_media" (Jdec.null ()) ()
        |> Jpipe.required "is_reddit_media_domain" Jdec.bool
        |> Jpipe.required "is_meta" Jdec.bool
        |> Jpipe.optional "category" (Jdec.null ()) ()
        |> Jpipe.required "secure_media_embed" mediaEmbed
        |> Jpipe.optional "link_flair_text" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "can_mod_post" Jdec.bool
        |> Jpipe.required "score" Jdec.int
        |> Jpipe.optional "approved_by" (Jdec.null ()) ()
        |> Jpipe.required "thumbnail" Jdec.string
        |> Jpipe.required "edited" edited
        |> Jpipe.optional "author_flair_css_class" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "author_flair_richtext" (Jdec.array authorFlairRichtext)
        |> Jpipe.optional "post_hint" (Jdec.nullable postHint) Nothing
        |> Jpipe.optional "content_categories" (Jdec.nullable (Jdec.array Jdec.string)) Nothing
        |> Jpipe.required "is_self" Jdec.bool
        |> Jpipe.optional "mod_note" (Jdec.null ()) ()
        |> Jpipe.required "created" Jdec.float
        |> Jpipe.required "link_flair_type" flairType
        |> Jpipe.required "wls" Jdec.int
        |> Jpipe.optional "banned_by" (Jdec.null ()) ()
        |> Jpipe.required "author_flair_type" flairType
        |> Jpipe.required "contest_mode" Jdec.bool
        |> Jpipe.optional "selftext_html" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "likes" (Jdec.null ()) ()
        |> Jpipe.optional "suggested_sort" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "banned_at_utc" (Jdec.null ()) ()
        |> Jpipe.optional "view_count" (Jdec.null ()) ()
        |> Jpipe.required "archived" Jdec.bool
        |> Jpipe.required "no_follow" Jdec.bool
        |> Jpipe.required "is_crosspostable" Jdec.bool
        |> Jpipe.required "pinned" Jdec.bool
        |> Jpipe.required "over_18" Jdec.bool
        |> Jpipe.optional "preview" (Jdec.nullable preview) Nothing
        |> Jpipe.required "media_only" Jdec.bool
        |> Jpipe.optional "link_flair_template_id" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "can_gild" Jdec.bool
        |> Jpipe.required "spoiler" Jdec.bool
        |> Jpipe.required "locked" Jdec.bool
        |> Jpipe.optional "author_flair_text" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "visited" Jdec.bool
        |> Jpipe.optional "num_reports" (Jdec.null ()) ()
        |> Jpipe.optional "distinguished" (Jdec.null ()) ()
        |> Jpipe.required "subreddit_id" Jdec.string
        |> Jpipe.optional "mod_reason_by" (Jdec.null ()) ()
        |> Jpipe.optional "removal_reason" (Jdec.null ()) ()
        |> Jpipe.required "link_flair_background_color" linkFlairBackgroundColor
        |> Jpipe.required "id" Jdec.string
        |> Jpipe.optional "report_reasons" (Jdec.null ()) ()
        |> Jpipe.required "author" Jdec.string
        |> Jpipe.required "num_crossposts" Jdec.int
        |> Jpipe.required "num_comments" Jdec.int
        |> Jpipe.required "send_replies" Jdec.bool
        |> Jpipe.required "mod_reports" (Jdec.array Jdec.value)
        |> Jpipe.optional "author_flair_text_color" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.required "permalink" Jdec.string
        |> Jpipe.required "whitelist_status" whitelistStatus
        |> Jpipe.required "stickied" Jdec.bool
        |> Jpipe.required "url" Jdec.string
        |> Jpipe.required "subreddit_subscribers" Jdec.int
        |> Jpipe.required "created_utc" Jdec.float
        |> Jpipe.optional "media" (Jdec.null ()) ()
        |> Jpipe.required "is_video" Jdec.bool

encodeChildData : ChildData -> Jenc.Value
encodeChildData x =
    Jenc.object
        [ ("approved_at_utc", always Jenc.null x.approvedAtUTC)
        , ("subreddit", Jenc.string x.subreddit)
        , ("selftext", Jenc.string x.selftext)
        , ("user_reports", makeArrayEncoder identity x.userReports)
        , ("saved", Jenc.bool x.saved)
        , ("mod_reason_title", always Jenc.null x.modReasonTitle)
        , ("gilded", Jenc.int x.gilded)
        , ("clicked", Jenc.bool x.clicked)
        , ("title", Jenc.string x.title)
        , ("link_flair_richtext", makeArrayEncoder encodeLinkFlairRichtext x.linkFlairRichtext)
        , ("subreddit_name_prefixed", Jenc.string x.subredditNamePrefixed)
        , ("hidden", Jenc.bool x.hidden)
        , ("pwls", Jenc.int x.pwls)
        , ("link_flair_css_class", makeNullableEncoder Jenc.string x.linkFlairCSSClass)
        , ("downs", Jenc.int x.downs)
        , ("thumbnail_height", makeNullableEncoder Jenc.int x.thumbnailHeight)
        , ("parent_whitelist_status", encodeWhitelistStatus x.parentWhitelistStatus)
        , ("hide_score", Jenc.bool x.hideScore)
        , ("name", Jenc.string x.name)
        , ("quarantine", Jenc.bool x.quarantine)
        , ("link_flair_text_color", encodeLinkFlairTextColor x.linkFlairTextColor)
        , ("author_flair_background_color", makeNullableEncoder Jenc.string x.authorFlairBackgroundColor)
        , ("subreddit_type", encodeSubredditType x.subredditType)
        , ("ups", Jenc.int x.ups)
        , ("domain", Jenc.string x.domain)
        , ("media_embed", encodeMediaEmbed x.mediaEmbed)
        , ("thumbnail_width", makeNullableEncoder Jenc.int x.thumbnailWidth)
        , ("author_flair_template_id", always Jenc.null x.authorFlairTemplateID)
        , ("is_original_content", Jenc.bool x.isOriginalContent)
        , ("secure_media", always Jenc.null x.secureMedia)
        , ("is_reddit_media_domain", Jenc.bool x.isRedditMediaDomain)
        , ("is_meta", Jenc.bool x.isMeta)
        , ("category", always Jenc.null x.category)
        , ("secure_media_embed", encodeMediaEmbed x.secureMediaEmbed)
        , ("link_flair_text", makeNullableEncoder Jenc.string x.linkFlairText)
        , ("can_mod_post", Jenc.bool x.canModPost)
        , ("score", Jenc.int x.score)
        , ("approved_by", always Jenc.null x.approvedBy)
        , ("thumbnail", Jenc.string x.thumbnail)
        , ("edited", encodeEdited x.edited)
        , ("author_flair_css_class", makeNullableEncoder Jenc.string x.authorFlairCSSClass)
        , ("author_flair_richtext", makeArrayEncoder encodeAuthorFlairRichtext x.authorFlairRichtext)
        , ("post_hint", makeNullableEncoder encodePostHint x.postHint)
        , ("content_categories", makeNullableEncoder (makeArrayEncoder Jenc.string) x.contentCategories)
        , ("is_self", Jenc.bool x.isSelf)
        , ("mod_note", always Jenc.null x.modNote)
        , ("created", Jenc.float x.created)
        , ("link_flair_type", encodeFlairType x.linkFlairType)
        , ("wls", Jenc.int x.wls)
        , ("banned_by", always Jenc.null x.bannedBy)
        , ("author_flair_type", encodeFlairType x.authorFlairType)
        , ("contest_mode", Jenc.bool x.contestMode)
        , ("selftext_html", makeNullableEncoder Jenc.string x.selftextHTML)
        , ("likes", always Jenc.null x.likes)
        , ("suggested_sort", makeNullableEncoder Jenc.string x.suggestedSort)
        , ("banned_at_utc", always Jenc.null x.bannedAtUTC)
        , ("view_count", always Jenc.null x.viewCount)
        , ("archived", Jenc.bool x.archived)
        , ("no_follow", Jenc.bool x.noFollow)
        , ("is_crosspostable", Jenc.bool x.isCrosspostable)
        , ("pinned", Jenc.bool x.pinned)
        , ("over_18", Jenc.bool x.over18)
        , ("preview", makeNullableEncoder encodePreview x.preview)
        , ("media_only", Jenc.bool x.mediaOnly)
        , ("link_flair_template_id", makeNullableEncoder Jenc.string x.linkFlairTemplateID)
        , ("can_gild", Jenc.bool x.canGild)
        , ("spoiler", Jenc.bool x.spoiler)
        , ("locked", Jenc.bool x.locked)
        , ("author_flair_text", makeNullableEncoder Jenc.string x.authorFlairText)
        , ("visited", Jenc.bool x.visited)
        , ("num_reports", always Jenc.null x.numReports)
        , ("distinguished", always Jenc.null x.distinguished)
        , ("subreddit_id", Jenc.string x.subredditID)
        , ("mod_reason_by", always Jenc.null x.modReasonBy)
        , ("removal_reason", always Jenc.null x.removalReason)
        , ("link_flair_background_color", encodeLinkFlairBackgroundColor x.linkFlairBackgroundColor)
        , ("id", Jenc.string x.id)
        , ("report_reasons", always Jenc.null x.reportReasons)
        , ("author", Jenc.string x.author)
        , ("num_crossposts", Jenc.int x.numCrossposts)
        , ("num_comments", Jenc.int x.numComments)
        , ("send_replies", Jenc.bool x.sendReplies)
        , ("mod_reports", makeArrayEncoder identity x.modReports)
        , ("author_flair_text_color", makeNullableEncoder Jenc.string x.authorFlairTextColor)
        , ("permalink", Jenc.string x.permalink)
        , ("whitelist_status", encodeWhitelistStatus x.whitelistStatus)
        , ("stickied", Jenc.bool x.stickied)
        , ("url", Jenc.string x.url)
        , ("subreddit_subscribers", Jenc.int x.subredditSubscribers)
        , ("created_utc", Jenc.float x.createdUTC)
        , ("media", always Jenc.null x.media)
        , ("is_video", Jenc.bool x.isVideo)
        ]

authorFlairRichtext : Jdec.Decoder AuthorFlairRichtext
authorFlairRichtext =
    Jpipe.decode AuthorFlairRichtext
        |> Jpipe.required "e" Jdec.string
        |> Jpipe.required "t" Jdec.string

encodeAuthorFlairRichtext : AuthorFlairRichtext -> Jenc.Value
encodeAuthorFlairRichtext x =
    Jenc.object
        [ ("e", Jenc.string x.e)
        , ("t", Jenc.string x.t)
        ]

flairType : Jdec.Decoder FlairType
flairType =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "richtext" -> Jdec.succeed Richtext
                "text" -> Jdec.succeed Text
                somethingElse -> Jdec.fail <| "Invalid FlairType: " ++ somethingElse
        )

encodeFlairType : FlairType -> Jenc.Value
encodeFlairType x = case x of
    Richtext -> Jenc.string "richtext"
    Text -> Jenc.string "text"

edited : Jdec.Decoder Edited
edited =
    Jdec.oneOf
        [ Jdec.map BoolInEdited Jdec.bool
        , Jdec.map DoubleInEdited Jdec.float
        ]

encodeEdited : Edited -> Jenc.Value
encodeEdited x = case x of
    BoolInEdited y -> Jenc.bool y
    DoubleInEdited y -> Jenc.float y

linkFlairBackgroundColor : Jdec.Decoder LinkFlairBackgroundColor
linkFlairBackgroundColor =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "" -> Jdec.succeed Empty
                "#ff4500" -> Jdec.succeed Ff4500
                "#6289d1" -> Jdec.succeed The6289D1
                somethingElse -> Jdec.fail <| "Invalid LinkFlairBackgroundColor: " ++ somethingElse
        )

encodeLinkFlairBackgroundColor : LinkFlairBackgroundColor -> Jenc.Value
encodeLinkFlairBackgroundColor x = case x of
    Empty -> Jenc.string ""
    Ff4500 -> Jenc.string "#ff4500"
    The6289D1 -> Jenc.string "#6289d1"

linkFlairRichtext : Jdec.Decoder LinkFlairRichtext
linkFlairRichtext =
    Jpipe.decode LinkFlairRichtext
        |> Jpipe.required "e" Jdec.string
        |> Jpipe.optional "t" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "a" (Jdec.nullable Jdec.string) Nothing
        |> Jpipe.optional "u" (Jdec.nullable Jdec.string) Nothing

encodeLinkFlairRichtext : LinkFlairRichtext -> Jenc.Value
encodeLinkFlairRichtext x =
    Jenc.object
        [ ("e", Jenc.string x.e)
        , ("t", makeNullableEncoder Jenc.string x.t)
        , ("a", makeNullableEncoder Jenc.string x.a)
        , ("u", makeNullableEncoder Jenc.string x.u)
        ]

linkFlairTextColor : Jdec.Decoder LinkFlairTextColor
linkFlairTextColor =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "dark" -> Jdec.succeed Dark
                "light" -> Jdec.succeed Light
                somethingElse -> Jdec.fail <| "Invalid LinkFlairTextColor: " ++ somethingElse
        )

encodeLinkFlairTextColor : LinkFlairTextColor -> Jenc.Value
encodeLinkFlairTextColor x = case x of
    Dark -> Jenc.string "dark"
    Light -> Jenc.string "light"

mediaEmbed : Jdec.Decoder MediaEmbed
mediaEmbed =
    Jpipe.decode MediaEmbed

encodeMediaEmbed : MediaEmbed -> Jenc.Value
encodeMediaEmbed x =
    Jenc.object
        [
        ]

whitelistStatus : Jdec.Decoder WhitelistStatus
whitelistStatus =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "all_ads" -> Jdec.succeed AllAds
                "house_only" -> Jdec.succeed HouseOnly
                "promo_all" -> Jdec.succeed PromoAll
                somethingElse -> Jdec.fail <| "Invalid WhitelistStatus: " ++ somethingElse
        )

encodeWhitelistStatus : WhitelistStatus -> Jenc.Value
encodeWhitelistStatus x = case x of
    AllAds -> Jenc.string "all_ads"
    HouseOnly -> Jenc.string "house_only"
    PromoAll -> Jenc.string "promo_all"

postHint : Jdec.Decoder PostHint
postHint =
    Jdec.string
        |> Jdec.andThen (\str ->
            case str of
                "image" -> Jdec.succeed Image
                "link" -> Jdec.succeed Link
                "self" -> Jdec.succeed Self
                somethingElse -> Jdec.fail <| "Invalid PostHint: " ++ somethingElse
        )

encodePostHint : PostHint -> Jenc.Value
encodePostHint x = case x of
    Image -> Jenc.string "image"
    Link -> Jenc.string "link"
    Self -> Jenc.string "self"

preview : Jdec.Decoder Preview
preview =
    Jpipe.decode Preview
        |> Jpipe.required "images" (Jdec.array imageElement)
        |> Jpipe.required "enabled" Jdec.bool
        |> Jpipe.optional "reddit_video_preview" (Jdec.nullable redditVideoPreview) Nothing

encodePreview : Preview -> Jenc.Value
encodePreview x =
    Jenc.object
        [ ("images", makeArrayEncoder encodeImageElement x.images)
        , ("enabled", Jenc.bool x.enabled)
        , ("reddit_video_preview", makeNullableEncoder encodeRedditVideoPreview x.redditVideoPreview)
        ]

imageElement : Jdec.Decoder ImageElement
imageElement =
    Jpipe.decode ImageElement
        |> Jpipe.required "source" source
        |> Jpipe.required "resolutions" (Jdec.array source)
        |> Jpipe.required "variants" variants
        |> Jpipe.required "id" Jdec.string

encodeImageElement : ImageElement -> Jenc.Value
encodeImageElement x =
    Jenc.object
        [ ("source", encodeSource x.source)
        , ("resolutions", makeArrayEncoder encodeSource x.resolutions)
        , ("variants", encodeVariants x.variants)
        , ("id", Jenc.string x.id)
        ]

source : Jdec.Decoder Source
source =
    Jpipe.decode Source
        |> Jpipe.required "url" Jdec.string
        |> Jpipe.required "width" Jdec.int
        |> Jpipe.required "height" Jdec.int

encodeSource : Source -> Jenc.Value
encodeSource x =
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
        |> Jpipe.required "source" source
        |> Jpipe.required "resolutions" (Jdec.array source)

encodeGIF : GIF -> Jenc.Value
encodeGIF x =
    Jenc.object
        [ ("source", encodeSource x.source)
        , ("resolutions", makeArrayEncoder encodeSource x.resolutions)
        ]

redditVideoPreview : Jdec.Decoder RedditVideoPreview
redditVideoPreview =
    Jpipe.decode RedditVideoPreview
        |> Jpipe.required "fallback_url" Jdec.string
        |> Jpipe.required "height" Jdec.int
        |> Jpipe.required "width" Jdec.int
        |> Jpipe.required "scrubber_media_url" Jdec.string
        |> Jpipe.required "dash_url" Jdec.string
        |> Jpipe.required "duration" Jdec.int
        |> Jpipe.required "hls_url" Jdec.string
        |> Jpipe.required "is_gif" Jdec.bool
        |> Jpipe.required "transcoding_status" Jdec.string

encodeRedditVideoPreview : RedditVideoPreview -> Jenc.Value
encodeRedditVideoPreview x =
    Jenc.object
        [ ("fallback_url", Jenc.string x.fallbackURL)
        , ("height", Jenc.int x.height)
        , ("width", Jenc.int x.width)
        , ("scrubber_media_url", Jenc.string x.scrubberMediaURL)
        , ("dash_url", Jenc.string x.dashURL)
        , ("duration", Jenc.int x.duration)
        , ("hls_url", Jenc.string x.hlsURL)
        , ("is_gif", Jenc.bool x.isGIF)
        , ("transcoding_status", Jenc.string x.transcodingStatus)
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
