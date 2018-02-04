//  To parse this JSON data, first install
//
//      Boost     http://www.boost.org
//      json.hpp  https://github.com/nlohmann/json
//
//  Then include this file, and then do
//
//     Reddit data = nlohmann::json::parse(jsonString);

#include "json.hpp"

namespace quicktype {
    using nlohmann::json;

    enum class ProviderName { CLIPPIT, GFYCAT, YOU_TUBE };

    enum class ProviderURL { HTTPS_WWW_YOUTUBE_COM, HTTP_CLIPPIT_TV, HTTP_GFYCAT_COM };

    enum class OembedType { VIDEO };

    enum class Version { THE_10 };

    struct Oembed {
        ProviderURL provider_url;
        std::unique_ptr<std::string> description;
        std::string title;
        int64_t thumbnail_width;
        int64_t height;
        int64_t width;
        std::string html;
        Version version;
        ProviderName provider_name;
        std::string thumbnail_url;
        OembedType type;
        int64_t thumbnail_height;
        std::unique_ptr<std::string> author_name;
        std::unique_ptr<std::string> author_url;
    };

    enum class MediaType { CLIPPITUSER_TV, GFYCAT_COM, YOUTUBE_COM };

    struct Media {
        MediaType type;
        struct Oembed oembed;
    };

    struct MediaEmbed {
        std::unique_ptr<std::string> content;
        std::unique_ptr<int64_t> width;
        std::unique_ptr<bool> scrolling;
        std::unique_ptr<int64_t> height;
        std::unique_ptr<std::string> media_domain_url;
    };

    enum class WhitelistStatus { ALL_ADS, PROMO_ALL };

    enum class PostHint { IMAGE, LINK, RICH_VIDEO, SELF };

    struct Resolution {
        std::string url;
        int64_t width;
        int64_t height;
    };

    struct Gif {
        struct Resolution source;
        std::vector<struct Resolution> resolutions;
    };

    struct Variants {
        std::unique_ptr<struct Gif> gif;
        std::unique_ptr<struct Gif> mp4;
    };

    struct Image {
        struct Resolution source;
        std::vector<struct Resolution> resolutions;
        struct Variants variants;
        std::string id;
    };

    struct Preview {
        std::vector<struct Image> images;
        bool enabled;
    };

    enum class SubredditType { PUBLIC };

    struct ChildData {
        std::string domain;
        nlohmann::json approved_at_utc;
        nlohmann::json mod_reason_by;
        nlohmann::json banned_by;
        nlohmann::json num_reports;
        std::string subreddit_id;
        std::unique_ptr<int64_t> thumbnail_width;
        std::string subreddit;
        std::unique_ptr<std::string> selftext_html;
        std::string selftext;
        nlohmann::json likes;
        std::unique_ptr<std::string> suggested_sort;
        std::vector<nlohmann::json> user_reports;
        std::unique_ptr<struct Media> secure_media;
        bool is_reddit_media_domain;
        std::unique_ptr<std::string> link_flair_text;
        std::string id;
        nlohmann::json banned_at_utc;
        nlohmann::json mod_reason_title;
        nlohmann::json view_count;
        bool archived;
        bool clicked;
        struct MediaEmbed media_embed;
        nlohmann::json report_reasons;
        std::string author;
        int64_t num_crossposts;
        bool saved;
        std::vector<nlohmann::json> mod_reports;
        bool can_mod_post;
        bool is_crosspostable;
        bool pinned;
        int64_t score;
        nlohmann::json approved_by;
        bool over_18;
        bool hidden;
        struct Preview preview;
        std::string thumbnail;
        bool edited;
        std::unique_ptr<std::string> link_flair_css_class;
        std::unique_ptr<std::string> author_flair_css_class;
        bool contest_mode;
        int64_t gilded;
        int64_t downs;
        bool brand_safe;
        struct MediaEmbed secure_media_embed;
        nlohmann::json removal_reason;
        PostHint post_hint;
        std::unique_ptr<std::string> author_flair_text;
        bool stickied;
        bool can_gild;
        std::unique_ptr<int64_t> thumbnail_height;
        WhitelistStatus parent_whitelist_status;
        std::string name;
        bool spoiler;
        std::string permalink;
        SubredditType subreddit_type;
        bool locked;
        bool hide_score;
        double created;
        std::string url;
        WhitelistStatus whitelist_status;
        bool quarantine;
        std::string title;
        double created_utc;
        std::string subreddit_name_prefixed;
        int64_t ups;
        std::unique_ptr<struct Media> media;
        int64_t num_comments;
        bool is_self;
        bool visited;
        nlohmann::json mod_note;
        bool is_video;
        nlohmann::json distinguished;
    };

    enum class Kind { T3 };

    struct Child {
        Kind kind;
        struct ChildData data;
    };

    struct RedditData {
        std::string after;
        int64_t dist;
        std::string modhash;
        std::string whitelist_status;
        std::vector<struct Child> children;
        nlohmann::json before;
    };

    struct Reddit {
        std::string kind;
        struct RedditData data;
    };
    
    inline json get_untyped(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<json>();
        }
        return json();
    }
    
    template <typename T>
    inline std::unique_ptr<T> get_optional(const json &j, const char *property) {
        if (j.find(property) != j.end())
            return j.at(property).get<std::unique_ptr<T>>();
        return std::unique_ptr<T>();
    }
}

namespace nlohmann {
    template <typename T>
    struct adl_serializer<std::unique_ptr<T>> {
        static void to_json(json& j, const std::unique_ptr<T>& opt) {
            if (!opt)
                j = nullptr;
            else
                j = *opt;
        }

        static std::unique_ptr<T> from_json(const json& j) {
            if (j.is_null())
                return std::unique_ptr<T>();
            else
                return std::unique_ptr<T>(new T(j.get<T>()));
        }
    };

    inline void from_json(const json& _j, struct quicktype::Oembed& _x) {
        _x.provider_url = _j.at("provider_url").get<quicktype::ProviderURL>();
        _x.description = quicktype::get_optional<std::string>(_j, "description");
        _x.title = _j.at("title").get<std::string>();
        _x.thumbnail_width = _j.at("thumbnail_width").get<int64_t>();
        _x.height = _j.at("height").get<int64_t>();
        _x.width = _j.at("width").get<int64_t>();
        _x.html = _j.at("html").get<std::string>();
        _x.version = _j.at("version").get<quicktype::Version>();
        _x.provider_name = _j.at("provider_name").get<quicktype::ProviderName>();
        _x.thumbnail_url = _j.at("thumbnail_url").get<std::string>();
        _x.type = _j.at("type").get<quicktype::OembedType>();
        _x.thumbnail_height = _j.at("thumbnail_height").get<int64_t>();
        _x.author_name = quicktype::get_optional<std::string>(_j, "author_name");
        _x.author_url = quicktype::get_optional<std::string>(_j, "author_url");
    }

    inline void to_json(json& _j, const struct quicktype::Oembed& _x) {
        _j = json::object();
        _j["provider_url"] = _x.provider_url;
        _j["description"] = _x.description;
        _j["title"] = _x.title;
        _j["thumbnail_width"] = _x.thumbnail_width;
        _j["height"] = _x.height;
        _j["width"] = _x.width;
        _j["html"] = _x.html;
        _j["version"] = _x.version;
        _j["provider_name"] = _x.provider_name;
        _j["thumbnail_url"] = _x.thumbnail_url;
        _j["type"] = _x.type;
        _j["thumbnail_height"] = _x.thumbnail_height;
        _j["author_name"] = _x.author_name;
        _j["author_url"] = _x.author_url;
    }

    inline void from_json(const json& _j, struct quicktype::Media& _x) {
        _x.type = _j.at("type").get<quicktype::MediaType>();
        _x.oembed = _j.at("oembed").get<struct quicktype::Oembed>();
    }

    inline void to_json(json& _j, const struct quicktype::Media& _x) {
        _j = json::object();
        _j["type"] = _x.type;
        _j["oembed"] = _x.oembed;
    }

    inline void from_json(const json& _j, struct quicktype::MediaEmbed& _x) {
        _x.content = quicktype::get_optional<std::string>(_j, "content");
        _x.width = quicktype::get_optional<int64_t>(_j, "width");
        _x.scrolling = quicktype::get_optional<bool>(_j, "scrolling");
        _x.height = quicktype::get_optional<int64_t>(_j, "height");
        _x.media_domain_url = quicktype::get_optional<std::string>(_j, "media_domain_url");
    }

    inline void to_json(json& _j, const struct quicktype::MediaEmbed& _x) {
        _j = json::object();
        _j["content"] = _x.content;
        _j["width"] = _x.width;
        _j["scrolling"] = _x.scrolling;
        _j["height"] = _x.height;
        _j["media_domain_url"] = _x.media_domain_url;
    }

    inline void from_json(const json& _j, struct quicktype::Resolution& _x) {
        _x.url = _j.at("url").get<std::string>();
        _x.width = _j.at("width").get<int64_t>();
        _x.height = _j.at("height").get<int64_t>();
    }

    inline void to_json(json& _j, const struct quicktype::Resolution& _x) {
        _j = json::object();
        _j["url"] = _x.url;
        _j["width"] = _x.width;
        _j["height"] = _x.height;
    }

    inline void from_json(const json& _j, struct quicktype::Gif& _x) {
        _x.source = _j.at("source").get<struct quicktype::Resolution>();
        _x.resolutions = _j.at("resolutions").get<std::vector<struct quicktype::Resolution>>();
    }

    inline void to_json(json& _j, const struct quicktype::Gif& _x) {
        _j = json::object();
        _j["source"] = _x.source;
        _j["resolutions"] = _x.resolutions;
    }

    inline void from_json(const json& _j, struct quicktype::Variants& _x) {
        _x.gif = quicktype::get_optional<struct quicktype::Gif>(_j, "gif");
        _x.mp4 = quicktype::get_optional<struct quicktype::Gif>(_j, "mp4");
    }

    inline void to_json(json& _j, const struct quicktype::Variants& _x) {
        _j = json::object();
        _j["gif"] = _x.gif;
        _j["mp4"] = _x.mp4;
    }

    inline void from_json(const json& _j, struct quicktype::Image& _x) {
        _x.source = _j.at("source").get<struct quicktype::Resolution>();
        _x.resolutions = _j.at("resolutions").get<std::vector<struct quicktype::Resolution>>();
        _x.variants = _j.at("variants").get<struct quicktype::Variants>();
        _x.id = _j.at("id").get<std::string>();
    }

    inline void to_json(json& _j, const struct quicktype::Image& _x) {
        _j = json::object();
        _j["source"] = _x.source;
        _j["resolutions"] = _x.resolutions;
        _j["variants"] = _x.variants;
        _j["id"] = _x.id;
    }

    inline void from_json(const json& _j, struct quicktype::Preview& _x) {
        _x.images = _j.at("images").get<std::vector<struct quicktype::Image>>();
        _x.enabled = _j.at("enabled").get<bool>();
    }

    inline void to_json(json& _j, const struct quicktype::Preview& _x) {
        _j = json::object();
        _j["images"] = _x.images;
        _j["enabled"] = _x.enabled;
    }

    inline void from_json(const json& _j, struct quicktype::ChildData& _x) {
        _x.domain = _j.at("domain").get<std::string>();
        _x.approved_at_utc = quicktype::get_untyped(_j, "approved_at_utc");
        _x.mod_reason_by = quicktype::get_untyped(_j, "mod_reason_by");
        _x.banned_by = quicktype::get_untyped(_j, "banned_by");
        _x.num_reports = quicktype::get_untyped(_j, "num_reports");
        _x.subreddit_id = _j.at("subreddit_id").get<std::string>();
        _x.thumbnail_width = quicktype::get_optional<int64_t>(_j, "thumbnail_width");
        _x.subreddit = _j.at("subreddit").get<std::string>();
        _x.selftext_html = quicktype::get_optional<std::string>(_j, "selftext_html");
        _x.selftext = _j.at("selftext").get<std::string>();
        _x.likes = quicktype::get_untyped(_j, "likes");
        _x.suggested_sort = quicktype::get_optional<std::string>(_j, "suggested_sort");
        _x.user_reports = _j.at("user_reports").get<std::vector<json>>();
        _x.secure_media = quicktype::get_optional<struct quicktype::Media>(_j, "secure_media");
        _x.is_reddit_media_domain = _j.at("is_reddit_media_domain").get<bool>();
        _x.link_flair_text = quicktype::get_optional<std::string>(_j, "link_flair_text");
        _x.id = _j.at("id").get<std::string>();
        _x.banned_at_utc = quicktype::get_untyped(_j, "banned_at_utc");
        _x.mod_reason_title = quicktype::get_untyped(_j, "mod_reason_title");
        _x.view_count = quicktype::get_untyped(_j, "view_count");
        _x.archived = _j.at("archived").get<bool>();
        _x.clicked = _j.at("clicked").get<bool>();
        _x.media_embed = _j.at("media_embed").get<struct quicktype::MediaEmbed>();
        _x.report_reasons = quicktype::get_untyped(_j, "report_reasons");
        _x.author = _j.at("author").get<std::string>();
        _x.num_crossposts = _j.at("num_crossposts").get<int64_t>();
        _x.saved = _j.at("saved").get<bool>();
        _x.mod_reports = _j.at("mod_reports").get<std::vector<json>>();
        _x.can_mod_post = _j.at("can_mod_post").get<bool>();
        _x.is_crosspostable = _j.at("is_crosspostable").get<bool>();
        _x.pinned = _j.at("pinned").get<bool>();
        _x.score = _j.at("score").get<int64_t>();
        _x.approved_by = quicktype::get_untyped(_j, "approved_by");
        _x.over_18 = _j.at("over_18").get<bool>();
        _x.hidden = _j.at("hidden").get<bool>();
        _x.preview = _j.at("preview").get<struct quicktype::Preview>();
        _x.thumbnail = _j.at("thumbnail").get<std::string>();
        _x.edited = _j.at("edited").get<bool>();
        _x.link_flair_css_class = quicktype::get_optional<std::string>(_j, "link_flair_css_class");
        _x.author_flair_css_class = quicktype::get_optional<std::string>(_j, "author_flair_css_class");
        _x.contest_mode = _j.at("contest_mode").get<bool>();
        _x.gilded = _j.at("gilded").get<int64_t>();
        _x.downs = _j.at("downs").get<int64_t>();
        _x.brand_safe = _j.at("brand_safe").get<bool>();
        _x.secure_media_embed = _j.at("secure_media_embed").get<struct quicktype::MediaEmbed>();
        _x.removal_reason = quicktype::get_untyped(_j, "removal_reason");
        _x.post_hint = _j.at("post_hint").get<quicktype::PostHint>();
        _x.author_flair_text = quicktype::get_optional<std::string>(_j, "author_flair_text");
        _x.stickied = _j.at("stickied").get<bool>();
        _x.can_gild = _j.at("can_gild").get<bool>();
        _x.thumbnail_height = quicktype::get_optional<int64_t>(_j, "thumbnail_height");
        _x.parent_whitelist_status = _j.at("parent_whitelist_status").get<quicktype::WhitelistStatus>();
        _x.name = _j.at("name").get<std::string>();
        _x.spoiler = _j.at("spoiler").get<bool>();
        _x.permalink = _j.at("permalink").get<std::string>();
        _x.subreddit_type = _j.at("subreddit_type").get<quicktype::SubredditType>();
        _x.locked = _j.at("locked").get<bool>();
        _x.hide_score = _j.at("hide_score").get<bool>();
        _x.created = _j.at("created").get<double>();
        _x.url = _j.at("url").get<std::string>();
        _x.whitelist_status = _j.at("whitelist_status").get<quicktype::WhitelistStatus>();
        _x.quarantine = _j.at("quarantine").get<bool>();
        _x.title = _j.at("title").get<std::string>();
        _x.created_utc = _j.at("created_utc").get<double>();
        _x.subreddit_name_prefixed = _j.at("subreddit_name_prefixed").get<std::string>();
        _x.ups = _j.at("ups").get<int64_t>();
        _x.media = quicktype::get_optional<struct quicktype::Media>(_j, "media");
        _x.num_comments = _j.at("num_comments").get<int64_t>();
        _x.is_self = _j.at("is_self").get<bool>();
        _x.visited = _j.at("visited").get<bool>();
        _x.mod_note = quicktype::get_untyped(_j, "mod_note");
        _x.is_video = _j.at("is_video").get<bool>();
        _x.distinguished = quicktype::get_untyped(_j, "distinguished");
    }

    inline void to_json(json& _j, const struct quicktype::ChildData& _x) {
        _j = json::object();
        _j["domain"] = _x.domain;
        _j["approved_at_utc"] = _x.approved_at_utc;
        _j["mod_reason_by"] = _x.mod_reason_by;
        _j["banned_by"] = _x.banned_by;
        _j["num_reports"] = _x.num_reports;
        _j["subreddit_id"] = _x.subreddit_id;
        _j["thumbnail_width"] = _x.thumbnail_width;
        _j["subreddit"] = _x.subreddit;
        _j["selftext_html"] = _x.selftext_html;
        _j["selftext"] = _x.selftext;
        _j["likes"] = _x.likes;
        _j["suggested_sort"] = _x.suggested_sort;
        _j["user_reports"] = _x.user_reports;
        _j["secure_media"] = _x.secure_media;
        _j["is_reddit_media_domain"] = _x.is_reddit_media_domain;
        _j["link_flair_text"] = _x.link_flair_text;
        _j["id"] = _x.id;
        _j["banned_at_utc"] = _x.banned_at_utc;
        _j["mod_reason_title"] = _x.mod_reason_title;
        _j["view_count"] = _x.view_count;
        _j["archived"] = _x.archived;
        _j["clicked"] = _x.clicked;
        _j["media_embed"] = _x.media_embed;
        _j["report_reasons"] = _x.report_reasons;
        _j["author"] = _x.author;
        _j["num_crossposts"] = _x.num_crossposts;
        _j["saved"] = _x.saved;
        _j["mod_reports"] = _x.mod_reports;
        _j["can_mod_post"] = _x.can_mod_post;
        _j["is_crosspostable"] = _x.is_crosspostable;
        _j["pinned"] = _x.pinned;
        _j["score"] = _x.score;
        _j["approved_by"] = _x.approved_by;
        _j["over_18"] = _x.over_18;
        _j["hidden"] = _x.hidden;
        _j["preview"] = _x.preview;
        _j["thumbnail"] = _x.thumbnail;
        _j["edited"] = _x.edited;
        _j["link_flair_css_class"] = _x.link_flair_css_class;
        _j["author_flair_css_class"] = _x.author_flair_css_class;
        _j["contest_mode"] = _x.contest_mode;
        _j["gilded"] = _x.gilded;
        _j["downs"] = _x.downs;
        _j["brand_safe"] = _x.brand_safe;
        _j["secure_media_embed"] = _x.secure_media_embed;
        _j["removal_reason"] = _x.removal_reason;
        _j["post_hint"] = _x.post_hint;
        _j["author_flair_text"] = _x.author_flair_text;
        _j["stickied"] = _x.stickied;
        _j["can_gild"] = _x.can_gild;
        _j["thumbnail_height"] = _x.thumbnail_height;
        _j["parent_whitelist_status"] = _x.parent_whitelist_status;
        _j["name"] = _x.name;
        _j["spoiler"] = _x.spoiler;
        _j["permalink"] = _x.permalink;
        _j["subreddit_type"] = _x.subreddit_type;
        _j["locked"] = _x.locked;
        _j["hide_score"] = _x.hide_score;
        _j["created"] = _x.created;
        _j["url"] = _x.url;
        _j["whitelist_status"] = _x.whitelist_status;
        _j["quarantine"] = _x.quarantine;
        _j["title"] = _x.title;
        _j["created_utc"] = _x.created_utc;
        _j["subreddit_name_prefixed"] = _x.subreddit_name_prefixed;
        _j["ups"] = _x.ups;
        _j["media"] = _x.media;
        _j["num_comments"] = _x.num_comments;
        _j["is_self"] = _x.is_self;
        _j["visited"] = _x.visited;
        _j["mod_note"] = _x.mod_note;
        _j["is_video"] = _x.is_video;
        _j["distinguished"] = _x.distinguished;
    }

    inline void from_json(const json& _j, struct quicktype::Child& _x) {
        _x.kind = _j.at("kind").get<quicktype::Kind>();
        _x.data = _j.at("data").get<struct quicktype::ChildData>();
    }

    inline void to_json(json& _j, const struct quicktype::Child& _x) {
        _j = json::object();
        _j["kind"] = _x.kind;
        _j["data"] = _x.data;
    }

    inline void from_json(const json& _j, struct quicktype::RedditData& _x) {
        _x.after = _j.at("after").get<std::string>();
        _x.dist = _j.at("dist").get<int64_t>();
        _x.modhash = _j.at("modhash").get<std::string>();
        _x.whitelist_status = _j.at("whitelist_status").get<std::string>();
        _x.children = _j.at("children").get<std::vector<struct quicktype::Child>>();
        _x.before = quicktype::get_untyped(_j, "before");
    }

    inline void to_json(json& _j, const struct quicktype::RedditData& _x) {
        _j = json::object();
        _j["after"] = _x.after;
        _j["dist"] = _x.dist;
        _j["modhash"] = _x.modhash;
        _j["whitelist_status"] = _x.whitelist_status;
        _j["children"] = _x.children;
        _j["before"] = _x.before;
    }

    inline void from_json(const json& _j, struct quicktype::Reddit& _x) {
        _x.kind = _j.at("kind").get<std::string>();
        _x.data = _j.at("data").get<struct quicktype::RedditData>();
    }

    inline void to_json(json& _j, const struct quicktype::Reddit& _x) {
        _j = json::object();
        _j["kind"] = _x.kind;
        _j["data"] = _x.data;
    }

    inline void from_json(const json& _j, quicktype::ProviderName& _x) {
        if (_j == "Clippit") _x = quicktype::ProviderName::CLIPPIT;
        else if (_j == "gfycat") _x = quicktype::ProviderName::GFYCAT;
        else if (_j == "YouTube") _x = quicktype::ProviderName::YOU_TUBE;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::ProviderName& _x) {
        switch (_x) {
            case quicktype::ProviderName::CLIPPIT: _j = "Clippit"; break;
            case quicktype::ProviderName::GFYCAT: _j = "gfycat"; break;
            case quicktype::ProviderName::YOU_TUBE: _j = "YouTube"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::ProviderURL& _x) {
        if (_j == "https://www.youtube.com/") _x = quicktype::ProviderURL::HTTPS_WWW_YOUTUBE_COM;
        else if (_j == "http://clippit.tv") _x = quicktype::ProviderURL::HTTP_CLIPPIT_TV;
        else if (_j == "http://gfycat.com") _x = quicktype::ProviderURL::HTTP_GFYCAT_COM;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::ProviderURL& _x) {
        switch (_x) {
            case quicktype::ProviderURL::HTTPS_WWW_YOUTUBE_COM: _j = "https://www.youtube.com/"; break;
            case quicktype::ProviderURL::HTTP_CLIPPIT_TV: _j = "http://clippit.tv"; break;
            case quicktype::ProviderURL::HTTP_GFYCAT_COM: _j = "http://gfycat.com"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::OembedType& _x) {
        if (_j == "video") _x = quicktype::OembedType::VIDEO;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::OembedType& _x) {
        switch (_x) {
            case quicktype::OembedType::VIDEO: _j = "video"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::Version& _x) {
        if (_j == "1.0") _x = quicktype::Version::THE_10;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::Version& _x) {
        switch (_x) {
            case quicktype::Version::THE_10: _j = "1.0"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::MediaType& _x) {
        if (_j == "clippituser.tv") _x = quicktype::MediaType::CLIPPITUSER_TV;
        else if (_j == "gfycat.com") _x = quicktype::MediaType::GFYCAT_COM;
        else if (_j == "youtube.com") _x = quicktype::MediaType::YOUTUBE_COM;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::MediaType& _x) {
        switch (_x) {
            case quicktype::MediaType::CLIPPITUSER_TV: _j = "clippituser.tv"; break;
            case quicktype::MediaType::GFYCAT_COM: _j = "gfycat.com"; break;
            case quicktype::MediaType::YOUTUBE_COM: _j = "youtube.com"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::WhitelistStatus& _x) {
        if (_j == "all_ads") _x = quicktype::WhitelistStatus::ALL_ADS;
        else if (_j == "promo_all") _x = quicktype::WhitelistStatus::PROMO_ALL;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::WhitelistStatus& _x) {
        switch (_x) {
            case quicktype::WhitelistStatus::ALL_ADS: _j = "all_ads"; break;
            case quicktype::WhitelistStatus::PROMO_ALL: _j = "promo_all"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::PostHint& _x) {
        if (_j == "image") _x = quicktype::PostHint::IMAGE;
        else if (_j == "link") _x = quicktype::PostHint::LINK;
        else if (_j == "rich:video") _x = quicktype::PostHint::RICH_VIDEO;
        else if (_j == "self") _x = quicktype::PostHint::SELF;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::PostHint& _x) {
        switch (_x) {
            case quicktype::PostHint::IMAGE: _j = "image"; break;
            case quicktype::PostHint::LINK: _j = "link"; break;
            case quicktype::PostHint::RICH_VIDEO: _j = "rich:video"; break;
            case quicktype::PostHint::SELF: _j = "self"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::SubredditType& _x) {
        if (_j == "public") _x = quicktype::SubredditType::PUBLIC;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::SubredditType& _x) {
        switch (_x) {
            case quicktype::SubredditType::PUBLIC: _j = "public"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::Kind& _x) {
        if (_j == "t3") _x = quicktype::Kind::T3;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::Kind& _x) {
        switch (_x) {
            case quicktype::Kind::T3: _j = "t3"; break;
            default: throw "This should not happen";
        }
    }

}
