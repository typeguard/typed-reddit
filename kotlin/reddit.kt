// To parse the JSON, install Klaxon and do:
//
//   val reddit = Reddit.fromJson(jsonString)

package quicktype

import com.beust.klaxon.*

private fun <T> Klaxon.convert(k: kotlin.reflect.KClass<*>, fromJson: (JsonValue) -> T, toJson: (T) -> String, isUnion: Boolean = false) =
    this.converter(object: Converter {
        @Suppress("UNCHECKED_CAST")
        override fun toJson(value: Any)        = toJson(value as T)
        override fun fromJson(jv: JsonValue)   = fromJson(jv) as Any
        override fun canConvert(cls: Class<*>) = cls == k.java || (isUnion && cls.superclass == k.java)
    })

private val klaxon = Klaxon()
    .convert(JsonObject::class,               { it.obj!! },                                        { it.toJsonString() })
    .convert(FlairType::class,                { FlairType.fromValue(it.string!!) },                { "\"${it.value}\"" })
    .convert(LinkFlairBackgroundColor::class, { LinkFlairBackgroundColor.fromValue(it.string!!) }, { "\"${it.value}\"" })
    .convert(LinkFlairTextColor::class,       { LinkFlairTextColor.fromValue(it.string!!) },       { "\"${it.value}\"" })
    .convert(WhitelistStatus::class,          { WhitelistStatus.fromValue(it.string!!) },          { "\"${it.value}\"" })
    .convert(PostHint::class,                 { PostHint.fromValue(it.string!!) },                 { "\"${it.value}\"" })
    .convert(SubredditType::class,            { SubredditType.fromValue(it.string!!) },            { "\"${it.value}\"" })
    .convert(Kind::class,                     { Kind.fromValue(it.string!!) },                     { "\"${it.value}\"" })
    .convert(Edited::class,                   { Edited.fromJson(it) },                             { it.toJson() }, true)

data class Reddit (
    val kind: String,
    val data: RedditData
) {
    public fun toJson() = klaxon.toJsonString(this)

    companion object {
        public fun fromJson(json: String) = klaxon.parse<Reddit>(json)
    }
}

data class RedditData (
    val modhash: String,
    val dist: Long,
    val children: List<Child>,
    val after: String,
    val before: Any? = null
)

data class Child (
    val kind: Kind,
    val data: ChildData
)

data class ChildData (
    @Json(name = "approved_at_utc")
    val approvedAtUTC: Any? = null,

    val subreddit: String,
    val selftext: String,

    @Json(name = "user_reports")
    val userReports: List<Any?>,

    val saved: Boolean,

    @Json(name = "mod_reason_title")
    val modReasonTitle: Any? = null,

    val gilded: Long,
    val clicked: Boolean,
    val title: String,

    @Json(name = "link_flair_richtext")
    val linkFlairRichtext: List<LinkFlairRichtext>,

    @Json(name = "subreddit_name_prefixed")
    val subredditNamePrefixed: String,

    val hidden: Boolean,
    val pwls: Long,

    @Json(name = "link_flair_css_class")
    val linkFlairCSSClass: String? = null,

    val downs: Long,

    @Json(name = "thumbnail_height")
    val thumbnailHeight: Long? = null,

    @Json(name = "parent_whitelist_status")
    val parentWhitelistStatus: WhitelistStatus,

    @Json(name = "hide_score")
    val hideScore: Boolean,

    val name: String,
    val quarantine: Boolean,

    @Json(name = "link_flair_text_color")
    val linkFlairTextColor: LinkFlairTextColor,

    @Json(name = "author_flair_background_color")
    val authorFlairBackgroundColor: String? = null,

    @Json(name = "subreddit_type")
    val subredditType: SubredditType,

    val ups: Long,
    val domain: String,

    @Json(name = "media_embed")
    val mediaEmbed: MediaEmbed,

    @Json(name = "thumbnail_width")
    val thumbnailWidth: Long? = null,

    @Json(name = "author_flair_template_id")
    val authorFlairTemplateID: Any? = null,

    @Json(name = "is_original_content")
    val isOriginalContent: Boolean,

    @Json(name = "secure_media")
    val secureMedia: Any? = null,

    @Json(name = "is_reddit_media_domain")
    val isRedditMediaDomain: Boolean,

    @Json(name = "is_meta")
    val isMeta: Boolean,

    val category: Any? = null,

    @Json(name = "secure_media_embed")
    val secureMediaEmbed: MediaEmbed,

    @Json(name = "link_flair_text")
    val linkFlairText: String? = null,

    @Json(name = "can_mod_post")
    val canModPost: Boolean,

    val score: Long,

    @Json(name = "approved_by")
    val approvedBy: Any? = null,

    val thumbnail: String,
    val edited: Edited,

    @Json(name = "author_flair_css_class")
    val authorFlairCSSClass: String? = null,

    @Json(name = "author_flair_richtext")
    val authorFlairRichtext: List<AuthorFlairRichtext>,

    @Json(name = "post_hint")
    val postHint: PostHint? = null,

    @Json(name = "content_categories")
    val contentCategories: List<String>? = null,

    @Json(name = "is_self")
    val isSelf: Boolean,

    @Json(name = "mod_note")
    val modNote: Any? = null,

    val created: Double,

    @Json(name = "link_flair_type")
    val linkFlairType: FlairType,

    val wls: Long,

    @Json(name = "banned_by")
    val bannedBy: Any? = null,

    @Json(name = "author_flair_type")
    val authorFlairType: FlairType,

    @Json(name = "contest_mode")
    val contestMode: Boolean,

    @Json(name = "selftext_html")
    val selftextHTML: String? = null,

    val likes: Any? = null,

    @Json(name = "suggested_sort")
    val suggestedSort: String? = null,

    @Json(name = "banned_at_utc")
    val bannedAtUTC: Any? = null,

    @Json(name = "view_count")
    val viewCount: Any? = null,

    val archived: Boolean,

    @Json(name = "no_follow")
    val noFollow: Boolean,

    @Json(name = "is_crosspostable")
    val isCrosspostable: Boolean,

    val pinned: Boolean,

    @Json(name = "over_18")
    val over18: Boolean,

    val preview: Preview? = null,

    @Json(name = "media_only")
    val mediaOnly: Boolean,

    @Json(name = "link_flair_template_id")
    val linkFlairTemplateID: String? = null,

    @Json(name = "can_gild")
    val canGild: Boolean,

    val spoiler: Boolean,
    val locked: Boolean,

    @Json(name = "author_flair_text")
    val authorFlairText: String? = null,

    val visited: Boolean,

    @Json(name = "num_reports")
    val numReports: Any? = null,

    val distinguished: Any? = null,

    @Json(name = "subreddit_id")
    val subredditID: String,

    @Json(name = "mod_reason_by")
    val modReasonBy: Any? = null,

    @Json(name = "removal_reason")
    val removalReason: Any? = null,

    @Json(name = "link_flair_background_color")
    val linkFlairBackgroundColor: LinkFlairBackgroundColor,

    val id: String,

    @Json(name = "report_reasons")
    val reportReasons: Any? = null,

    val author: String,

    @Json(name = "num_crossposts")
    val numCrossposts: Long,

    @Json(name = "num_comments")
    val numComments: Long,

    @Json(name = "send_replies")
    val sendReplies: Boolean,

    @Json(name = "mod_reports")
    val modReports: List<Any?>,

    @Json(name = "author_flair_text_color")
    val authorFlairTextColor: String? = null,

    val permalink: String,

    @Json(name = "whitelist_status")
    val whitelistStatus: WhitelistStatus,

    val stickied: Boolean,
    val url: String,

    @Json(name = "subreddit_subscribers")
    val subredditSubscribers: Long,

    @Json(name = "created_utc")
    val createdUTC: Double,

    val media: Any? = null,

    @Json(name = "is_video")
    val isVideo: Boolean
)

data class AuthorFlairRichtext (
    val e: String,
    val t: String
)

enum class FlairType(val value: String) {
    Richtext("richtext"),
    Text("text");

    companion object {
        public fun fromValue(value: String): FlairType = when (value) {
            "richtext" -> Richtext
            "text"     -> Text
            else       -> throw IllegalArgumentException()
        }
    }
}

sealed class Edited {
    class BoolValue(val value: Boolean)  : Edited()
    class DoubleValue(val value: Double) : Edited()

    public fun toJson(): String = klaxon.toJsonString(when (this) {
        is BoolValue   -> this.value
        is DoubleValue -> this.value
    })

    companion object {
        public fun fromJson(jv: JsonValue): Edited = when (jv.inside) {
            is Boolean -> BoolValue(jv.boolean!!)
            is Double  -> DoubleValue(jv.double!!)
            else       -> throw IllegalArgumentException()
        }
    }
}

enum class LinkFlairBackgroundColor(val value: String) {
    Empty(""),
    Ff4500("#ff4500"),
    The6289D1("#6289d1");

    companion object {
        public fun fromValue(value: String): LinkFlairBackgroundColor = when (value) {
            ""        -> Empty
            "#ff4500" -> Ff4500
            "#6289d1" -> The6289D1
            else      -> throw IllegalArgumentException()
        }
    }
}

data class LinkFlairRichtext (
    val e: String,
    val t: String? = null,
    val a: String? = null,
    val u: String? = null
)

enum class LinkFlairTextColor(val value: String) {
    Dark("dark"),
    Light("light");

    companion object {
        public fun fromValue(value: String): LinkFlairTextColor = when (value) {
            "dark"  -> Dark
            "light" -> Light
            else    -> throw IllegalArgumentException()
        }
    }
}

typealias MediaEmbed = JsonObject

enum class WhitelistStatus(val value: String) {
    AllAds("all_ads"),
    HouseOnly("house_only"),
    PromoAll("promo_all");

    companion object {
        public fun fromValue(value: String): WhitelistStatus = when (value) {
            "all_ads"    -> AllAds
            "house_only" -> HouseOnly
            "promo_all"  -> PromoAll
            else         -> throw IllegalArgumentException()
        }
    }
}

enum class PostHint(val value: String) {
    Image("image"),
    Link("link"),
    Self("self");

    companion object {
        public fun fromValue(value: String): PostHint = when (value) {
            "image" -> Image
            "link"  -> Link
            "self"  -> Self
            else    -> throw IllegalArgumentException()
        }
    }
}

data class Preview (
    val images: List<Image>,
    val enabled: Boolean,

    @Json(name = "reddit_video_preview")
    val redditVideoPreview: RedditVideoPreview? = null
)

data class Image (
    val source: Source,
    val resolutions: List<Source>,
    val variants: Variants,
    val id: String
)

data class Source (
    val url: String,
    val width: Long,
    val height: Long
)

data class Variants (
    val gif: GIF? = null,
    val mp4: GIF? = null
)

data class GIF (
    val source: Source,
    val resolutions: List<Source>
)

data class RedditVideoPreview (
    @Json(name = "fallback_url")
    val fallbackURL: String,

    val height: Long,
    val width: Long,

    @Json(name = "scrubber_media_url")
    val scrubberMediaURL: String,

    @Json(name = "dash_url")
    val dashURL: String,

    val duration: Long,

    @Json(name = "hls_url")
    val hlsURL: String,

    @Json(name = "is_gif")
    val isGIF: Boolean,

    @Json(name = "transcoding_status")
    val transcodingStatus: String
)

enum class SubredditType(val value: String) {
    Public("public");

    companion object {
        public fun fromValue(value: String): SubredditType = when (value) {
            "public" -> Public
            else     -> throw IllegalArgumentException()
        }
    }
}

enum class Kind(val value: String) {
    T3("t3");

    companion object {
        public fun fromValue(value: String): Kind = when (value) {
            "t3" -> T3
            else -> throw IllegalArgumentException()
        }
    }
}
