// To parse this JSON data, add NuGet 'Newtonsoft.Json' then do:
//
//    using QuickType;
//
//    var reddit = Reddit.FromJson(jsonString);

namespace QuickType
{
    using System;
    using System.Collections.Generic;

    using System.Globalization;
    using Newtonsoft.Json;
    using Newtonsoft.Json.Converters;

    public partial class Reddit
    {
        [JsonProperty("kind")]
        public string Kind { get; set; }

        [JsonProperty("data")]
        public RedditData Data { get; set; }
    }

    public partial class RedditData
    {
        [JsonProperty("modhash")]
        public string Modhash { get; set; }

        [JsonProperty("dist")]
        public long Dist { get; set; }

        [JsonProperty("children")]
        public Child[] Children { get; set; }

        [JsonProperty("after")]
        public string After { get; set; }

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
        [JsonProperty("approved_at_utc")]
        public object ApprovedAtUtc { get; set; }

        [JsonProperty("subreddit")]
        public string Subreddit { get; set; }

        [JsonProperty("selftext")]
        public string Selftext { get; set; }

        [JsonProperty("user_reports")]
        public object[] UserReports { get; set; }

        [JsonProperty("saved")]
        public bool Saved { get; set; }

        [JsonProperty("mod_reason_title")]
        public object ModReasonTitle { get; set; }

        [JsonProperty("gilded")]
        public long Gilded { get; set; }

        [JsonProperty("clicked")]
        public bool Clicked { get; set; }

        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("link_flair_richtext")]
        public LinkFlairRichtext[] LinkFlairRichtext { get; set; }

        [JsonProperty("subreddit_name_prefixed")]
        public string SubredditNamePrefixed { get; set; }

        [JsonProperty("hidden")]
        public bool Hidden { get; set; }

        [JsonProperty("pwls")]
        public long Pwls { get; set; }

        [JsonProperty("link_flair_css_class")]
        public string LinkFlairCssClass { get; set; }

        [JsonProperty("downs")]
        public long Downs { get; set; }

        [JsonProperty("thumbnail_height")]
        public long? ThumbnailHeight { get; set; }

        [JsonProperty("parent_whitelist_status")]
        public WhitelistStatus ParentWhitelistStatus { get; set; }

        [JsonProperty("hide_score")]
        public bool HideScore { get; set; }

        [JsonProperty("name")]
        public string Name { get; set; }

        [JsonProperty("quarantine")]
        public bool Quarantine { get; set; }

        [JsonProperty("link_flair_text_color")]
        public LinkFlairTextColor LinkFlairTextColor { get; set; }

        [JsonProperty("author_flair_background_color")]
        public string AuthorFlairBackgroundColor { get; set; }

        [JsonProperty("subreddit_type")]
        public SubredditType SubredditType { get; set; }

        [JsonProperty("ups")]
        public long Ups { get; set; }

        [JsonProperty("domain")]
        public string Domain { get; set; }

        [JsonProperty("media_embed")]
        public MediaEmbed MediaEmbed { get; set; }

        [JsonProperty("thumbnail_width")]
        public long? ThumbnailWidth { get; set; }

        [JsonProperty("author_flair_template_id")]
        public object AuthorFlairTemplateId { get; set; }

        [JsonProperty("is_original_content")]
        public bool IsOriginalContent { get; set; }

        [JsonProperty("secure_media")]
        public object SecureMedia { get; set; }

        [JsonProperty("is_reddit_media_domain")]
        public bool IsRedditMediaDomain { get; set; }

        [JsonProperty("is_meta")]
        public bool IsMeta { get; set; }

        [JsonProperty("category")]
        public object Category { get; set; }

        [JsonProperty("secure_media_embed")]
        public MediaEmbed SecureMediaEmbed { get; set; }

        [JsonProperty("link_flair_text")]
        public string LinkFlairText { get; set; }

        [JsonProperty("can_mod_post")]
        public bool CanModPost { get; set; }

        [JsonProperty("score")]
        public long Score { get; set; }

        [JsonProperty("approved_by")]
        public object ApprovedBy { get; set; }

        [JsonProperty("thumbnail")]
        public string Thumbnail { get; set; }

        [JsonProperty("edited")]
        public Edited Edited { get; set; }

        [JsonProperty("author_flair_css_class")]
        public string AuthorFlairCssClass { get; set; }

        [JsonProperty("author_flair_richtext")]
        public AuthorFlairRichtext[] AuthorFlairRichtext { get; set; }

        [JsonProperty("post_hint", NullValueHandling = NullValueHandling.Ignore)]
        public PostHint? PostHint { get; set; }

        [JsonProperty("content_categories")]
        public string[] ContentCategories { get; set; }

        [JsonProperty("is_self")]
        public bool IsSelf { get; set; }

        [JsonProperty("mod_note")]
        public object ModNote { get; set; }

        [JsonProperty("created")]
        public double Created { get; set; }

        [JsonProperty("link_flair_type")]
        public FlairType LinkFlairType { get; set; }

        [JsonProperty("wls")]
        public long Wls { get; set; }

        [JsonProperty("banned_by")]
        public object BannedBy { get; set; }

        [JsonProperty("author_flair_type")]
        public FlairType AuthorFlairType { get; set; }

        [JsonProperty("contest_mode")]
        public bool ContestMode { get; set; }

        [JsonProperty("selftext_html")]
        public string SelftextHtml { get; set; }

        [JsonProperty("likes")]
        public object Likes { get; set; }

        [JsonProperty("suggested_sort")]
        public string SuggestedSort { get; set; }

        [JsonProperty("banned_at_utc")]
        public object BannedAtUtc { get; set; }

        [JsonProperty("view_count")]
        public object ViewCount { get; set; }

        [JsonProperty("archived")]
        public bool Archived { get; set; }

        [JsonProperty("no_follow")]
        public bool NoFollow { get; set; }

        [JsonProperty("is_crosspostable")]
        public bool IsCrosspostable { get; set; }

        [JsonProperty("pinned")]
        public bool Pinned { get; set; }

        [JsonProperty("over_18")]
        public bool Over18 { get; set; }

        [JsonProperty("preview", NullValueHandling = NullValueHandling.Ignore)]
        public Preview Preview { get; set; }

        [JsonProperty("media_only")]
        public bool MediaOnly { get; set; }

        [JsonProperty("link_flair_template_id")]
        public Guid? LinkFlairTemplateId { get; set; }

        [JsonProperty("can_gild")]
        public bool CanGild { get; set; }

        [JsonProperty("spoiler")]
        public bool Spoiler { get; set; }

        [JsonProperty("locked")]
        public bool Locked { get; set; }

        [JsonProperty("author_flair_text")]
        public string AuthorFlairText { get; set; }

        [JsonProperty("visited")]
        public bool Visited { get; set; }

        [JsonProperty("num_reports")]
        public object NumReports { get; set; }

        [JsonProperty("distinguished")]
        public object Distinguished { get; set; }

        [JsonProperty("subreddit_id")]
        public string SubredditId { get; set; }

        [JsonProperty("mod_reason_by")]
        public object ModReasonBy { get; set; }

        [JsonProperty("removal_reason")]
        public object RemovalReason { get; set; }

        [JsonProperty("link_flair_background_color")]
        public LinkFlairBackgroundColor LinkFlairBackgroundColor { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }

        [JsonProperty("report_reasons")]
        public object ReportReasons { get; set; }

        [JsonProperty("author")]
        public string Author { get; set; }

        [JsonProperty("num_crossposts")]
        public long NumCrossposts { get; set; }

        [JsonProperty("num_comments")]
        public long NumComments { get; set; }

        [JsonProperty("send_replies")]
        public bool SendReplies { get; set; }

        [JsonProperty("mod_reports")]
        public object[] ModReports { get; set; }

        [JsonProperty("author_flair_text_color")]
        public string AuthorFlairTextColor { get; set; }

        [JsonProperty("permalink")]
        public string Permalink { get; set; }

        [JsonProperty("whitelist_status")]
        public WhitelistStatus WhitelistStatus { get; set; }

        [JsonProperty("stickied")]
        public bool Stickied { get; set; }

        [JsonProperty("url")]
        public string Url { get; set; }

        [JsonProperty("subreddit_subscribers")]
        public long SubredditSubscribers { get; set; }

        [JsonProperty("created_utc")]
        public double CreatedUtc { get; set; }

        [JsonProperty("media")]
        public object Media { get; set; }

        [JsonProperty("is_video")]
        public bool IsVideo { get; set; }
    }

    public partial class AuthorFlairRichtext
    {
        [JsonProperty("e")]
        public string E { get; set; }

        [JsonProperty("t")]
        public string T { get; set; }
    }

    public partial class LinkFlairRichtext
    {
        [JsonProperty("e")]
        public string E { get; set; }

        [JsonProperty("t", NullValueHandling = NullValueHandling.Ignore)]
        public string T { get; set; }

        [JsonProperty("a", NullValueHandling = NullValueHandling.Ignore)]
        public string A { get; set; }

        [JsonProperty("u", NullValueHandling = NullValueHandling.Ignore)]
        public string U { get; set; }
    }

    public partial class MediaEmbed
    {
    }

    public partial class Preview
    {
        [JsonProperty("images")]
        public Image[] Images { get; set; }

        [JsonProperty("enabled")]
        public bool Enabled { get; set; }

        [JsonProperty("reddit_video_preview", NullValueHandling = NullValueHandling.Ignore)]
        public RedditVideoPreview RedditVideoPreview { get; set; }
    }

    public partial class Image
    {
        [JsonProperty("source")]
        public Source Source { get; set; }

        [JsonProperty("resolutions")]
        public Source[] Resolutions { get; set; }

        [JsonProperty("variants")]
        public Variants Variants { get; set; }

        [JsonProperty("id")]
        public string Id { get; set; }
    }

    public partial class Source
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
        [JsonProperty("gif", NullValueHandling = NullValueHandling.Ignore)]
        public Gif Gif { get; set; }

        [JsonProperty("mp4", NullValueHandling = NullValueHandling.Ignore)]
        public Gif Mp4 { get; set; }
    }

    public partial class Gif
    {
        [JsonProperty("source")]
        public Source Source { get; set; }

        [JsonProperty("resolutions")]
        public Source[] Resolutions { get; set; }
    }

    public partial class RedditVideoPreview
    {
        [JsonProperty("fallback_url")]
        public string FallbackUrl { get; set; }

        [JsonProperty("height")]
        public long Height { get; set; }

        [JsonProperty("width")]
        public long Width { get; set; }

        [JsonProperty("scrubber_media_url")]
        public string ScrubberMediaUrl { get; set; }

        [JsonProperty("dash_url")]
        public string DashUrl { get; set; }

        [JsonProperty("duration")]
        public long Duration { get; set; }

        [JsonProperty("hls_url")]
        public string HlsUrl { get; set; }

        [JsonProperty("is_gif")]
        public bool IsGif { get; set; }

        [JsonProperty("transcoding_status")]
        public string TranscodingStatus { get; set; }
    }

    public enum FlairType { Richtext, Text };

    public enum LinkFlairBackgroundColor { Empty, Ff4500, The6289D1 };

    public enum LinkFlairTextColor { Dark, Light };

    public enum WhitelistStatus { AllAds, HouseOnly, PromoAll };

    public enum PostHint { Image, Link, Self };

    public enum SubredditType { Public };

    public enum Kind { T3 };

    public partial struct Edited
    {
        public bool? Bool;
        public double? Double;

        public static implicit operator Edited(bool Bool) => new Edited { Bool = Bool };
        public static implicit operator Edited(double Double) => new Edited { Double = Double };
    }

    public partial class Reddit
    {
        public static Reddit FromJson(string json) => JsonConvert.DeserializeObject<Reddit>(json, QuickType.Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this Reddit self) => JsonConvert.SerializeObject(self, QuickType.Converter.Settings);
    }

    internal static class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters = {
                FlairTypeConverter.Singleton,
                EditedConverter.Singleton,
                LinkFlairBackgroundColorConverter.Singleton,
                LinkFlairTextColorConverter.Singleton,
                WhitelistStatusConverter.Singleton,
                PostHintConverter.Singleton,
                SubredditTypeConverter.Singleton,
                KindConverter.Singleton,
                new IsoDateTimeConverter { DateTimeStyles = DateTimeStyles.AssumeUniversal }
            },
        };
    }

    internal class FlairTypeConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(FlairType) || t == typeof(FlairType?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "richtext":
                    return FlairType.Richtext;
                case "text":
                    return FlairType.Text;
            }
            throw new Exception("Cannot unmarshal type FlairType");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (FlairType)untypedValue;
            switch (value)
            {
                case FlairType.Richtext:
                    serializer.Serialize(writer, "richtext");
                    return;
                case FlairType.Text:
                    serializer.Serialize(writer, "text");
                    return;
            }
            throw new Exception("Cannot marshal type FlairType");
        }

        public static readonly FlairTypeConverter Singleton = new FlairTypeConverter();
    }

    internal class EditedConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(Edited) || t == typeof(Edited?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            switch (reader.TokenType)
            {
                case JsonToken.Integer:
                case JsonToken.Float:
                    var doubleValue = serializer.Deserialize<double>(reader);
                    return new Edited { Double = doubleValue };
                case JsonToken.Boolean:
                    var boolValue = serializer.Deserialize<bool>(reader);
                    return new Edited { Bool = boolValue };
            }
            throw new Exception("Cannot unmarshal type Edited");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            var value = (Edited)untypedValue;
            if (value.Double != null)
            {
                serializer.Serialize(writer, value.Double.Value);
                return;
            }
            if (value.Bool != null)
            {
                serializer.Serialize(writer, value.Bool.Value);
                return;
            }
            throw new Exception("Cannot marshal type Edited");
        }

        public static readonly EditedConverter Singleton = new EditedConverter();
    }

    internal class LinkFlairBackgroundColorConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(LinkFlairBackgroundColor) || t == typeof(LinkFlairBackgroundColor?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "":
                    return LinkFlairBackgroundColor.Empty;
                case "#6289d1":
                    return LinkFlairBackgroundColor.The6289D1;
                case "#ff4500":
                    return LinkFlairBackgroundColor.Ff4500;
            }
            throw new Exception("Cannot unmarshal type LinkFlairBackgroundColor");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (LinkFlairBackgroundColor)untypedValue;
            switch (value)
            {
                case LinkFlairBackgroundColor.Empty:
                    serializer.Serialize(writer, "");
                    return;
                case LinkFlairBackgroundColor.The6289D1:
                    serializer.Serialize(writer, "#6289d1");
                    return;
                case LinkFlairBackgroundColor.Ff4500:
                    serializer.Serialize(writer, "#ff4500");
                    return;
            }
            throw new Exception("Cannot marshal type LinkFlairBackgroundColor");
        }

        public static readonly LinkFlairBackgroundColorConverter Singleton = new LinkFlairBackgroundColorConverter();
    }

    internal class LinkFlairTextColorConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(LinkFlairTextColor) || t == typeof(LinkFlairTextColor?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "dark":
                    return LinkFlairTextColor.Dark;
                case "light":
                    return LinkFlairTextColor.Light;
            }
            throw new Exception("Cannot unmarshal type LinkFlairTextColor");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (LinkFlairTextColor)untypedValue;
            switch (value)
            {
                case LinkFlairTextColor.Dark:
                    serializer.Serialize(writer, "dark");
                    return;
                case LinkFlairTextColor.Light:
                    serializer.Serialize(writer, "light");
                    return;
            }
            throw new Exception("Cannot marshal type LinkFlairTextColor");
        }

        public static readonly LinkFlairTextColorConverter Singleton = new LinkFlairTextColorConverter();
    }

    internal class WhitelistStatusConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(WhitelistStatus) || t == typeof(WhitelistStatus?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "all_ads":
                    return WhitelistStatus.AllAds;
                case "house_only":
                    return WhitelistStatus.HouseOnly;
                case "promo_all":
                    return WhitelistStatus.PromoAll;
            }
            throw new Exception("Cannot unmarshal type WhitelistStatus");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (WhitelistStatus)untypedValue;
            switch (value)
            {
                case WhitelistStatus.AllAds:
                    serializer.Serialize(writer, "all_ads");
                    return;
                case WhitelistStatus.HouseOnly:
                    serializer.Serialize(writer, "house_only");
                    return;
                case WhitelistStatus.PromoAll:
                    serializer.Serialize(writer, "promo_all");
                    return;
            }
            throw new Exception("Cannot marshal type WhitelistStatus");
        }

        public static readonly WhitelistStatusConverter Singleton = new WhitelistStatusConverter();
    }

    internal class PostHintConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(PostHint) || t == typeof(PostHint?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            switch (value)
            {
                case "image":
                    return PostHint.Image;
                case "link":
                    return PostHint.Link;
                case "self":
                    return PostHint.Self;
            }
            throw new Exception("Cannot unmarshal type PostHint");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (PostHint)untypedValue;
            switch (value)
            {
                case PostHint.Image:
                    serializer.Serialize(writer, "image");
                    return;
                case PostHint.Link:
                    serializer.Serialize(writer, "link");
                    return;
                case PostHint.Self:
                    serializer.Serialize(writer, "self");
                    return;
            }
            throw new Exception("Cannot marshal type PostHint");
        }

        public static readonly PostHintConverter Singleton = new PostHintConverter();
    }

    internal class SubredditTypeConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(SubredditType) || t == typeof(SubredditType?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            if (value == "public")
            {
                return SubredditType.Public;
            }
            throw new Exception("Cannot unmarshal type SubredditType");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (SubredditType)untypedValue;
            if (value == SubredditType.Public)
            {
                serializer.Serialize(writer, "public");
                return;
            }
            throw new Exception("Cannot marshal type SubredditType");
        }

        public static readonly SubredditTypeConverter Singleton = new SubredditTypeConverter();
    }

    internal class KindConverter : JsonConverter
    {
        public override bool CanConvert(Type t) => t == typeof(Kind) || t == typeof(Kind?);

        public override object ReadJson(JsonReader reader, Type t, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Null) return null;
            var value = serializer.Deserialize<string>(reader);
            if (value == "t3")
            {
                return Kind.T3;
            }
            throw new Exception("Cannot unmarshal type Kind");
        }

        public override void WriteJson(JsonWriter writer, object untypedValue, JsonSerializer serializer)
        {
            if (untypedValue == null)
            {
                serializer.Serialize(writer, null);
                return;
            }
            var value = (Kind)untypedValue;
            if (value == Kind.T3)
            {
                serializer.Serialize(writer, "t3");
                return;
            }
            throw new Exception("Cannot marshal type Kind");
        }

        public static readonly KindConverter Singleton = new KindConverter();
    }
}
