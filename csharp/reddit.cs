// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using QuickType;
//
//    var data = Reddit.FromJson(jsonString);

namespace QuickType
{
    using System;
    using System.Net;
    using System.Collections.Generic;

    using Newtonsoft.Json;

    public partial class Reddit
    {
        [JsonProperty("kind")]
        public string Kind { get; set; }

        [JsonProperty("data")]
        public RedditData Data { get; set; }
    }

    public partial class RedditData
    {
        [JsonProperty("after")]
        public string After { get; set; }

        [JsonProperty("dist")]
        public long Dist { get; set; }

        [JsonProperty("modhash")]
        public string Modhash { get; set; }

        [JsonProperty("whitelist_status")]
        public string WhitelistStatus { get; set; }

        [JsonProperty("children")]
        public Child[] Children { get; set; }

        [JsonProperty("before")]
        public object Before { get; set; }
    }

    public partial class Child
    {
        [JsonProperty("kind")]
        public Kind Kind { get; set; }

        [JsonProperty("data")]
        public ChildData Data { get; set; }
    }

    public partial class ChildData
    {
        [JsonProperty("domain")]
        public string Domain { get; set; }

        [JsonProperty("approved_at_utc")]
        public object ApprovedAtUtc { get; set; }

        [JsonProperty("mod_reason_by")]
        public object ModReasonBy { get; set; }

        [JsonProperty("banned_by")]
        public object BannedBy { get; set; }

        [JsonProperty("num_reports")]
        public object NumReports { get; set; }

        [JsonProperty("subreddit_id")]
        public string SubredditId { get; set; }

        [JsonProperty("thumbnail_width")]
        public long? ThumbnailWidth { get; set; }

        [JsonProperty("subreddit")]
        public string Subreddit { get; set; }

        [JsonProperty("selftext_html")]
        public string SelftextHtml { get; set; }

        [JsonProperty("selftext")]
        public string Selftext { get; set; }

        [JsonProperty("likes")]
        public object Likes { get; set; }

        [JsonProperty("suggested_sort")]
        public string SuggestedSort { get; set; }

        [JsonProperty("user_reports")]
        public object[] UserReports { get; set; }

        [JsonProperty("secure_media")]
        public Media SecureMedia { get; set; }

        [JsonProperty("is_reddit_media_domain")]
        public bool IsRedditMediaDomain { get; set; }

        [JsonProperty("link_flair_text")]
        public string LinkFlairText { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("banned_at_utc")]
        public object BannedAtUtc { get; set; }

        [JsonProperty("mod_reason_title")]
        public object ModReasonTitle { get; set; }

        [JsonProperty("view_count")]
        public object ViewCount { get; set; }

        [JsonProperty("archived")]
        public bool Archived { get; set; }

        [JsonProperty("clicked")]
        public bool Clicked { get; set; }

        [JsonProperty("media_embed")]
        public MediaEmbed MediaEmbed { get; set; }

        [JsonProperty("report_reasons")]
        public object ReportReasons { get; set; }

        [JsonProperty("author")]
        public string Author { get; set; }

        [JsonProperty("num_crossposts")]
        public long NumCrossposts { get; set; }

        [JsonProperty("saved")]
        public bool Saved { get; set; }

        [JsonProperty("mod_reports")]
        public object[] ModReports { get; set; }

        [JsonProperty("can_mod_post")]
        public bool CanModPost { get; set; }

        [JsonProperty("is_crosspostable")]
        public bool IsCrosspostable { get; set; }

        [JsonProperty("pinned")]
        public bool Pinned { get; set; }

        [JsonProperty("score")]
        public long Score { get; set; }

        [JsonProperty("approved_by")]
        public object ApprovedBy { get; set; }

        [JsonProperty("over_18")]
        public bool Over18 { get; set; }

        [JsonProperty("hidden")]
        public bool Hidden { get; set; }

        [JsonProperty("preview")]
        public Preview Preview { get; set; }

        [JsonProperty("thumbnail")]
        public string Thumbnail { get; set; }

        [JsonProperty("edited")]
        public bool Edited { get; set; }

        [JsonProperty("link_flair_css_class")]
        public string LinkFlairCssClass { get; set; }

        [JsonProperty("author_flair_css_class")]
        public string AuthorFlairCssClass { get; set; }

        [JsonProperty("contest_mode")]
        public bool ContestMode { get; set; }

        [JsonProperty("gilded")]
        public long Gilded { get; set; }

        [JsonProperty("downs")]
        public long Downs { get; set; }

        [JsonProperty("brand_safe")]
        public bool BrandSafe { get; set; }

        [JsonProperty("secure_media_embed")]
        public MediaEmbed SecureMediaEmbed { get; set; }

        [JsonProperty("removal_reason")]
        public object RemovalReason { get; set; }

        [JsonProperty("post_hint")]
        public PostHint PostHint { get; set; }

        [JsonProperty("author_flair_text")]
        public string AuthorFlairText { get; set; }

        [JsonProperty("stickied")]
        public bool Stickied { get; set; }

        [JsonProperty("can_gild")]
        public bool CanGild { get; set; }

        [JsonProperty("thumbnail_height")]
        public long? ThumbnailHeight { get; set; }

        [JsonProperty("parent_whitelist_status")]
        public WhitelistStatus ParentWhitelistStatus { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("spoiler")]
        public bool Spoiler { get; set; }

        [JsonProperty("permalink")]
        public string Permalink { get; set; }

        [JsonProperty("subreddit_type")]
        public SubredditType SubredditType { get; set; }

        [JsonProperty("locked")]
        public bool Locked { get; set; }

        [JsonProperty("hide_score")]
        public bool HideScore { get; set; }

        [JsonProperty("created")]
        public double Created { get; set; }

        [JsonProperty("url")]
        public string Url { get; set; }

        [JsonProperty("whitelist_status")]
        public WhitelistStatus WhitelistStatus { get; set; }

        [JsonProperty("quarantine")]
        public bool Quarantine { get; set; }

        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("created_utc")]
        public double CreatedUtc { get; set; }

        [JsonProperty("subreddit_name_prefixed")]
        public string SubredditNamePrefixed { get; set; }

        [JsonProperty("ups")]
        public long Ups { get; set; }

        [JsonProperty("media")]
        public Media Media { get; set; }

        [JsonProperty("num_comments")]
        public long NumComments { get; set; }

        [JsonProperty("is_self")]
        public bool IsSelf { get; set; }

        [JsonProperty("visited")]
        public bool Visited { get; set; }

        [JsonProperty("mod_note")]
        public object ModNote { get; set; }

        [JsonProperty("is_video")]
        public bool IsVideo { get; set; }

        [JsonProperty("distinguished")]
        public object Distinguished { get; set; }
    }

    public partial class Media
    {
        [JsonProperty("type")]
        public MediaType PurpleType { get; set; }

        [JsonProperty("oembed")]
        public Oembed Oembed { get; set; }
    }

    public partial class Oembed
    {
        [JsonProperty("provider_url")]
        public ProviderUrl ProviderUrl { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }

        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("thumbnail_width")]
        public long ThumbnailWidth { get; set; }

        [JsonProperty("height")]
        public long Height { get; set; }

        [JsonProperty("width")]
        public long Width { get; set; }

        [JsonProperty("html")]
        public string Html { get; set; }

        [JsonProperty("version")]
        public Version Version { get; set; }

        [JsonProperty("provider_name")]
        public ProviderName ProviderName { get; set; }

        [JsonProperty("thumbnail_url")]
        public string ThumbnailUrl { get; set; }

        [JsonProperty("type")]
        public OembedType PurpleType { get; set; }

        [JsonProperty("thumbnail_height")]
        public long ThumbnailHeight { get; set; }

        [JsonProperty("author_name")]
        public string AuthorName { get; set; }

        [JsonProperty("author_url")]
        public string AuthorUrl { get; set; }
    }

    public partial class MediaEmbed
    {
        [JsonProperty("content")]
        public string Content { get; set; }

        [JsonProperty("width")]
        public long? Width { get; set; }

        [JsonProperty("scrolling")]
        public bool? Scrolling { get; set; }

        [JsonProperty("height")]
        public long? Height { get; set; }

        [JsonProperty("media_domain_url")]
        public string MediaDomainUrl { get; set; }
    }

    public partial class Preview
    {
        [JsonProperty("images")]
        public Image[] Images { get; set; }

        [JsonProperty("enabled")]
        public bool Enabled { get; set; }
    }

    public partial class Image
    {
        [JsonProperty("source")]
        public Resolution Source { get; set; }

        [JsonProperty("resolutions")]
        public Resolution[] Resolutions { get; set; }

        [JsonProperty("variants")]
        public Variants Variants { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }
    }

    public partial class Resolution
    {
        [JsonProperty("url")]
        public string Url { get; set; }

        [JsonProperty("width")]
        public long Width { get; set; }

        [JsonProperty("height")]
        public long Height { get; set; }
    }

    public partial class Variants
    {
        [JsonProperty("gif")]
        public Gif Gif { get; set; }

        [JsonProperty("mp4")]
        public Gif Mp4 { get; set; }
    }

    public partial class Gif
    {
        [JsonProperty("source")]
        public Resolution Source { get; set; }

        [JsonProperty("resolutions")]
        public Resolution[] Resolutions { get; set; }
    }

    public enum ProviderName { Clippit, Gfycat, YouTube };

    public enum ProviderUrl { HttpClippitTv, HttpGfycatCom, HttpsWwwYoutubeCom };

    public enum OembedType { Video };

    public enum Version { The10 };

    public enum MediaType { ClippituserTv, GfycatCom, YoutubeCom };

    public enum WhitelistStatus { AllAds, PromoAll, PromoSpecified };

    public enum PostHint { Image, Link, RichVideo, Self };

    public enum SubredditType { Public };

    public enum Kind { T3 };

    public partial class Reddit
    {
        public static Reddit FromJson(string json) => JsonConvert.DeserializeObject<Reddit>(json, Converter.Settings);
    }

    static class ProviderNameExtensions
    {
        public static ProviderName? ValueForString(string str)
        {
            switch (str)
            {
                case "Clippit": return ProviderName.Clippit;
                case "gfycat": return ProviderName.Gfycat;
                case "YouTube": return ProviderName.YouTube;
                default: return null;
            }
        }

        public static ProviderName ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this ProviderName value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case ProviderName.Clippit: serializer.Serialize(writer, "Clippit"); break;
                case ProviderName.Gfycat: serializer.Serialize(writer, "gfycat"); break;
                case ProviderName.YouTube: serializer.Serialize(writer, "YouTube"); break;
            }
        }
    }

    static class ProviderUrlExtensions
    {
        public static ProviderUrl? ValueForString(string str)
        {
            switch (str)
            {
                case "http://clippit.tv": return ProviderUrl.HttpClippitTv;
                case "http://gfycat.com": return ProviderUrl.HttpGfycatCom;
                case "https://www.youtube.com/": return ProviderUrl.HttpsWwwYoutubeCom;
                default: return null;
            }
        }

        public static ProviderUrl ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this ProviderUrl value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case ProviderUrl.HttpClippitTv: serializer.Serialize(writer, "http://clippit.tv"); break;
                case ProviderUrl.HttpGfycatCom: serializer.Serialize(writer, "http://gfycat.com"); break;
                case ProviderUrl.HttpsWwwYoutubeCom: serializer.Serialize(writer, "https://www.youtube.com/"); break;
            }
        }
    }

    static class OembedTypeExtensions
    {
        public static OembedType? ValueForString(string str)
        {
            switch (str)
            {
                case "video": return OembedType.Video;
                default: return null;
            }
        }

        public static OembedType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this OembedType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case OembedType.Video: serializer.Serialize(writer, "video"); break;
            }
        }
    }

    static class VersionExtensions
    {
        public static Version? ValueForString(string str)
        {
            switch (str)
            {
                case "1.0": return Version.The10;
                default: return null;
            }
        }

        public static Version ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this Version value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case Version.The10: serializer.Serialize(writer, "1.0"); break;
            }
        }
    }

    static class MediaTypeExtensions
    {
        public static MediaType? ValueForString(string str)
        {
            switch (str)
            {
                case "clippituser.tv": return MediaType.ClippituserTv;
                case "gfycat.com": return MediaType.GfycatCom;
                case "youtube.com": return MediaType.YoutubeCom;
                default: return null;
            }
        }

        public static MediaType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this MediaType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case MediaType.ClippituserTv: serializer.Serialize(writer, "clippituser.tv"); break;
                case MediaType.GfycatCom: serializer.Serialize(writer, "gfycat.com"); break;
                case MediaType.YoutubeCom: serializer.Serialize(writer, "youtube.com"); break;
            }
        }
    }

    static class WhitelistStatusExtensions
    {
        public static WhitelistStatus? ValueForString(string str)
        {
            switch (str)
            {
                case "all_ads": return WhitelistStatus.AllAds;
                case "promo_all": return WhitelistStatus.PromoAll;
                case "promo_specified": return WhitelistStatus.PromoSpecified;
                default: return null;
            }
        }

        public static WhitelistStatus ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this WhitelistStatus value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case WhitelistStatus.AllAds: serializer.Serialize(writer, "all_ads"); break;
                case WhitelistStatus.PromoAll: serializer.Serialize(writer, "promo_all"); break;
                case WhitelistStatus.PromoSpecified: serializer.Serialize(writer, "promo_specified"); break;
            }
        }
    }

    static class PostHintExtensions
    {
        public static PostHint? ValueForString(string str)
        {
            switch (str)
            {
                case "image": return PostHint.Image;
                case "link": return PostHint.Link;
                case "rich:video": return PostHint.RichVideo;
                case "self": return PostHint.Self;
                default: return null;
            }
        }

        public static PostHint ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this PostHint value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case PostHint.Image: serializer.Serialize(writer, "image"); break;
                case PostHint.Link: serializer.Serialize(writer, "link"); break;
                case PostHint.RichVideo: serializer.Serialize(writer, "rich:video"); break;
                case PostHint.Self: serializer.Serialize(writer, "self"); break;
            }
        }
    }

    static class SubredditTypeExtensions
    {
        public static SubredditType? ValueForString(string str)
        {
            switch (str)
            {
                case "public": return SubredditType.Public;
                default: return null;
            }
        }

        public static SubredditType ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this SubredditType value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case SubredditType.Public: serializer.Serialize(writer, "public"); break;
            }
        }
    }

    static class KindExtensions
    {
        public static Kind? ValueForString(string str)
        {
            switch (str)
            {
                case "t3": return Kind.T3;
                default: return null;
            }
        }

        public static Kind ReadJson(JsonReader reader, JsonSerializer serializer)
        {
            var str = serializer.Deserialize<string>(reader);
            var maybeValue = ValueForString(str);
            if (maybeValue.HasValue) return maybeValue.Value;
            throw new Exception("Unknown enum case " + str);
        }

        public static void WriteJson(this Kind value, JsonWriter writer, JsonSerializer serializer)
        {
            switch (value)
            {
                case Kind.T3: serializer.Serialize(writer, "t3"); break;
            }
        }
    }

    public static class Serialize
    {
        public static string ToJson(this Reddit self) => JsonConvert.SerializeObject(self, Converter.Settings);
    }

    public class Converter: JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(ProviderName) || t == typeof(ProviderUrl) || t == typeof(OembedType) || t == typeof(Version) || t == typeof(MediaType) || t == typeof(WhitelistStatus) || t == typeof(PostHint) || t == typeof(SubredditType) || t == typeof(Kind) || t == typeof(ProviderName?) || t == typeof(ProviderUrl?) || t == typeof(OembedType?) || t == typeof(Version?) || t == typeof(MediaType?) || t == typeof(WhitelistStatus?) || t == typeof(PostHint?) || t == typeof(SubredditType?) || t == typeof(Kind?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (t == typeof(ProviderName))
                return ProviderNameExtensions.ReadJson(reader, serializer);
            if (t == typeof(ProviderUrl))
                return ProviderUrlExtensions.ReadJson(reader, serializer);
            if (t == typeof(OembedType))
                return OembedTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(Version))
                return VersionExtensions.ReadJson(reader, serializer);
            if (t == typeof(MediaType))
                return MediaTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(WhitelistStatus))
                return WhitelistStatusExtensions.ReadJson(reader, serializer);
            if (t == typeof(PostHint))
                return PostHintExtensions.ReadJson(reader, serializer);
            if (t == typeof(SubredditType))
                return SubredditTypeExtensions.ReadJson(reader, serializer);
            if (t == typeof(Kind))
                return KindExtensions.ReadJson(reader, serializer);
            if (t == typeof(ProviderName?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return ProviderNameExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(ProviderUrl?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return ProviderUrlExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(OembedType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return OembedTypeExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(Version?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return VersionExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(MediaType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return MediaTypeExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(WhitelistStatus?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return WhitelistStatusExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(PostHint?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return PostHintExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(SubredditType?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return SubredditTypeExtensions.ReadJson(reader, serializer);
            }
            if (t == typeof(Kind?))
            {
                if (reader.TokenType == JsonToken.Null) return null;
                return KindExtensions.ReadJson(reader, serializer);
            }
            throw new Exception("Unknown type");
        }

        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            var t = value.GetType();
            if (t == typeof(ProviderName))
            {
                ((ProviderName)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(ProviderUrl))
            {
                ((ProviderUrl)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(OembedType))
            {
                ((OembedType)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(Version))
            {
                ((Version)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(MediaType))
            {
                ((MediaType)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(WhitelistStatus))
            {
                ((WhitelistStatus)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(PostHint))
            {
                ((PostHint)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(SubredditType))
            {
                ((SubredditType)value).WriteJson(writer, serializer);
                return;
            }
            if (t == typeof(Kind))
            {
                ((Kind)value).WriteJson(writer, serializer);
                return;
            }
            throw new Exception("Unknown type");
        }

        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters = { new Converter() },
        };
    }
}
