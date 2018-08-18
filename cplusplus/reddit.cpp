//  To parse this JSON data, first install
//
//      Boost     http://www.boost.org
//      json.hpp  https://github.com/nlohmann/json
//
//  Then include this file, and then do
//
//     Reddit data = nlohmann::json::parse(jsonString);

#pragma once

#include <boost/variant.hpp>
#include "json.hpp"

#include <boost/optional.hpp>
#include <stdexcept>
#include <regex>
namespace nlohmann {
    template <typename T>
    struct adl_serializer<std::shared_ptr<T>> {
        static void to_json(json& j, const std::shared_ptr<T>& opt) {
            if (!opt) j = nullptr; else j = *opt;
        }

        static std::shared_ptr<T> from_json(const json& j) {
            if (j.is_null()) return std::unique_ptr<T>(); else return std::unique_ptr<T>(new T(j.get<T>()));
        }
    };
}

namespace quicktype {
    using nlohmann::json;

    inline json get_untyped(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<json>();
        }
        return json();
    }

    template <typename T>
    inline std::shared_ptr<T> get_optional(const json &j, const char *property) {
        if (j.find(property) != j.end()) {
            return j.at(property).get<std::shared_ptr<T>>();
        }
        return std::shared_ptr<T>();
    }

    class AuthorFlairRichtext {
        public:
        AuthorFlairRichtext() = default;
        virtual ~AuthorFlairRichtext() = default;

        private:
        std::string e;
        std::string t;

        public:
        const std::string & get_e() const { return e; }
        std::string & get_mutable_e() { return e; }
        void set_e(const std::string& value) { this->e = value; }

        const std::string & get_t() const { return t; }
        std::string & get_mutable_t() { return t; }
        void set_t(const std::string& value) { this->t = value; }
    };

    enum class FlairType : int { RICHTEXT, TEXT };

    typedef boost::variant<bool, double> Edited;

    enum class LinkFlairBackgroundColor : int { EMPTY, FF4500, THE_6289_D1 };

    class LinkFlairRichtext {
        public:
        LinkFlairRichtext() = default;
        virtual ~LinkFlairRichtext() = default;

        private:
        std::string e;
        std::shared_ptr<std::string> t;
        std::shared_ptr<std::string> a;
        std::shared_ptr<std::string> u;

        public:
        const std::string & get_e() const { return e; }
        std::string & get_mutable_e() { return e; }
        void set_e(const std::string& value) { this->e = value; }

        std::shared_ptr<std::string> get_t() const { return t; }
        void set_t(std::shared_ptr<std::string> value) { this->t = value; }

        std::shared_ptr<std::string> get_a() const { return a; }
        void set_a(std::shared_ptr<std::string> value) { this->a = value; }

        std::shared_ptr<std::string> get_u() const { return u; }
        void set_u(std::shared_ptr<std::string> value) { this->u = value; }
    };

    enum class LinkFlairTextColor : int { DARK, LIGHT };

    class MediaEmbed {
        public:
        MediaEmbed() = default;
        virtual ~MediaEmbed() = default;

        private:

        public:
    };

    enum class WhitelistStatus : int { ALL_ADS, HOUSE_ONLY, PROMO_ALL };

    enum class PostHint : int { IMAGE, LINK, SELF };

    class Source {
        public:
        Source() = default;
        virtual ~Source() = default;

        private:
        std::string url;
        int64_t width;
        int64_t height;

        public:
        const std::string & get_url() const { return url; }
        std::string & get_mutable_url() { return url; }
        void set_url(const std::string& value) { this->url = value; }

        const int64_t & get_width() const { return width; }
        int64_t & get_mutable_width() { return width; }
        void set_width(const int64_t& value) { this->width = value; }

        const int64_t & get_height() const { return height; }
        int64_t & get_mutable_height() { return height; }
        void set_height(const int64_t& value) { this->height = value; }
    };

    class Gif {
        public:
        Gif() = default;
        virtual ~Gif() = default;

        private:
        Source source;
        std::vector<Source> resolutions;

        public:
        const Source & get_source() const { return source; }
        Source & get_mutable_source() { return source; }
        void set_source(const Source& value) { this->source = value; }

        const std::vector<Source> & get_resolutions() const { return resolutions; }
        std::vector<Source> & get_mutable_resolutions() { return resolutions; }
        void set_resolutions(const std::vector<Source>& value) { this->resolutions = value; }
    };

    class Variants {
        public:
        Variants() = default;
        virtual ~Variants() = default;

        private:
        std::shared_ptr<Gif> gif;
        std::shared_ptr<Gif> mp4;

        public:
        std::shared_ptr<Gif> get_gif() const { return gif; }
        void set_gif(std::shared_ptr<Gif> value) { this->gif = value; }

        std::shared_ptr<Gif> get_mp4() const { return mp4; }
        void set_mp4(std::shared_ptr<Gif> value) { this->mp4 = value; }
    };

    class Image {
        public:
        Image() = default;
        virtual ~Image() = default;

        private:
        Source source;
        std::vector<Source> resolutions;
        Variants variants;
        std::string id;

        public:
        const Source & get_source() const { return source; }
        Source & get_mutable_source() { return source; }
        void set_source(const Source& value) { this->source = value; }

        const std::vector<Source> & get_resolutions() const { return resolutions; }
        std::vector<Source> & get_mutable_resolutions() { return resolutions; }
        void set_resolutions(const std::vector<Source>& value) { this->resolutions = value; }

        const Variants & get_variants() const { return variants; }
        Variants & get_mutable_variants() { return variants; }
        void set_variants(const Variants& value) { this->variants = value; }

        const std::string & get_id() const { return id; }
        std::string & get_mutable_id() { return id; }
        void set_id(const std::string& value) { this->id = value; }
    };

    class RedditVideoPreview {
        public:
        RedditVideoPreview() = default;
        virtual ~RedditVideoPreview() = default;

        private:
        std::string fallback_url;
        int64_t height;
        int64_t width;
        std::string scrubber_media_url;
        std::string dash_url;
        int64_t duration;
        std::string hls_url;
        bool is_gif;
        std::string transcoding_status;

        public:
        const std::string & get_fallback_url() const { return fallback_url; }
        std::string & get_mutable_fallback_url() { return fallback_url; }
        void set_fallback_url(const std::string& value) { this->fallback_url = value; }

        const int64_t & get_height() const { return height; }
        int64_t & get_mutable_height() { return height; }
        void set_height(const int64_t& value) { this->height = value; }

        const int64_t & get_width() const { return width; }
        int64_t & get_mutable_width() { return width; }
        void set_width(const int64_t& value) { this->width = value; }

        const std::string & get_scrubber_media_url() const { return scrubber_media_url; }
        std::string & get_mutable_scrubber_media_url() { return scrubber_media_url; }
        void set_scrubber_media_url(const std::string& value) { this->scrubber_media_url = value; }

        const std::string & get_dash_url() const { return dash_url; }
        std::string & get_mutable_dash_url() { return dash_url; }
        void set_dash_url(const std::string& value) { this->dash_url = value; }

        const int64_t & get_duration() const { return duration; }
        int64_t & get_mutable_duration() { return duration; }
        void set_duration(const int64_t& value) { this->duration = value; }

        const std::string & get_hls_url() const { return hls_url; }
        std::string & get_mutable_hls_url() { return hls_url; }
        void set_hls_url(const std::string& value) { this->hls_url = value; }

        const bool & get_is_gif() const { return is_gif; }
        bool & get_mutable_is_gif() { return is_gif; }
        void set_is_gif(const bool& value) { this->is_gif = value; }

        const std::string & get_transcoding_status() const { return transcoding_status; }
        std::string & get_mutable_transcoding_status() { return transcoding_status; }
        void set_transcoding_status(const std::string& value) { this->transcoding_status = value; }
    };

    class Preview {
        public:
        Preview() = default;
        virtual ~Preview() = default;

        private:
        std::vector<Image> images;
        bool enabled;
        std::shared_ptr<RedditVideoPreview> reddit_video_preview;

        public:
        const std::vector<Image> & get_images() const { return images; }
        std::vector<Image> & get_mutable_images() { return images; }
        void set_images(const std::vector<Image>& value) { this->images = value; }

        const bool & get_enabled() const { return enabled; }
        bool & get_mutable_enabled() { return enabled; }
        void set_enabled(const bool& value) { this->enabled = value; }

        std::shared_ptr<RedditVideoPreview> get_reddit_video_preview() const { return reddit_video_preview; }
        void set_reddit_video_preview(std::shared_ptr<RedditVideoPreview> value) { this->reddit_video_preview = value; }
    };

    enum class SubredditType : int { PUBLIC };

    class ChildData {
        public:
        ChildData() = default;
        virtual ~ChildData() = default;

        private:
        nlohmann::json approved_at_utc;
        std::string subreddit;
        std::string selftext;
        std::vector<nlohmann::json> user_reports;
        bool saved;
        nlohmann::json mod_reason_title;
        int64_t gilded;
        bool clicked;
        std::string title;
        std::vector<LinkFlairRichtext> link_flair_richtext;
        std::string subreddit_name_prefixed;
        bool hidden;
        int64_t pwls;
        std::shared_ptr<std::string> link_flair_css_class;
        int64_t downs;
        std::shared_ptr<int64_t> thumbnail_height;
        WhitelistStatus parent_whitelist_status;
        bool hide_score;
        std::string name;
        bool quarantine;
        LinkFlairTextColor link_flair_text_color;
        std::shared_ptr<std::string> author_flair_background_color;
        SubredditType subreddit_type;
        int64_t ups;
        std::string domain;
        MediaEmbed media_embed;
        std::shared_ptr<int64_t> thumbnail_width;
        nlohmann::json author_flair_template_id;
        bool is_original_content;
        nlohmann::json secure_media;
        bool is_reddit_media_domain;
        bool is_meta;
        nlohmann::json category;
        MediaEmbed secure_media_embed;
        std::shared_ptr<std::string> link_flair_text;
        bool can_mod_post;
        int64_t score;
        nlohmann::json approved_by;
        std::string thumbnail;
        Edited edited;
        std::shared_ptr<std::string> author_flair_css_class;
        std::vector<AuthorFlairRichtext> author_flair_richtext;
        std::shared_ptr<PostHint> post_hint;
        std::shared_ptr<std::vector<std::string>> content_categories;
        bool is_self;
        nlohmann::json mod_note;
        double created;
        FlairType link_flair_type;
        int64_t wls;
        nlohmann::json banned_by;
        FlairType author_flair_type;
        bool contest_mode;
        std::shared_ptr<std::string> selftext_html;
        nlohmann::json likes;
        std::shared_ptr<std::string> suggested_sort;
        nlohmann::json banned_at_utc;
        nlohmann::json view_count;
        bool archived;
        bool no_follow;
        bool is_crosspostable;
        bool pinned;
        bool over_18;
        std::shared_ptr<Preview> preview;
        bool media_only;
        std::shared_ptr<std::string> link_flair_template_id;
        bool can_gild;
        bool spoiler;
        bool locked;
        std::shared_ptr<std::string> author_flair_text;
        bool visited;
        nlohmann::json num_reports;
        nlohmann::json distinguished;
        std::string subreddit_id;
        nlohmann::json mod_reason_by;
        nlohmann::json removal_reason;
        LinkFlairBackgroundColor link_flair_background_color;
        std::string id;
        nlohmann::json report_reasons;
        std::string author;
        int64_t num_crossposts;
        int64_t num_comments;
        bool send_replies;
        std::vector<nlohmann::json> mod_reports;
        std::shared_ptr<std::string> author_flair_text_color;
        std::string permalink;
        WhitelistStatus whitelist_status;
        bool stickied;
        std::string url;
        int64_t subreddit_subscribers;
        double created_utc;
        nlohmann::json media;
        bool is_video;

        public:
        const nlohmann::json & get_approved_at_utc() const { return approved_at_utc; }
        nlohmann::json & get_mutable_approved_at_utc() { return approved_at_utc; }
        void set_approved_at_utc(const nlohmann::json& value) { this->approved_at_utc = value; }

        const std::string & get_subreddit() const { return subreddit; }
        std::string & get_mutable_subreddit() { return subreddit; }
        void set_subreddit(const std::string& value) { this->subreddit = value; }

        const std::string & get_selftext() const { return selftext; }
        std::string & get_mutable_selftext() { return selftext; }
        void set_selftext(const std::string& value) { this->selftext = value; }

        const std::vector<nlohmann::json> & get_user_reports() const { return user_reports; }
        std::vector<nlohmann::json> & get_mutable_user_reports() { return user_reports; }
        void set_user_reports(const std::vector<nlohmann::json>& value) { this->user_reports = value; }

        const bool & get_saved() const { return saved; }
        bool & get_mutable_saved() { return saved; }
        void set_saved(const bool& value) { this->saved = value; }

        const nlohmann::json & get_mod_reason_title() const { return mod_reason_title; }
        nlohmann::json & get_mutable_mod_reason_title() { return mod_reason_title; }
        void set_mod_reason_title(const nlohmann::json& value) { this->mod_reason_title = value; }

        const int64_t & get_gilded() const { return gilded; }
        int64_t & get_mutable_gilded() { return gilded; }
        void set_gilded(const int64_t& value) { this->gilded = value; }

        const bool & get_clicked() const { return clicked; }
        bool & get_mutable_clicked() { return clicked; }
        void set_clicked(const bool& value) { this->clicked = value; }

        const std::string & get_title() const { return title; }
        std::string & get_mutable_title() { return title; }
        void set_title(const std::string& value) { this->title = value; }

        const std::vector<LinkFlairRichtext> & get_link_flair_richtext() const { return link_flair_richtext; }
        std::vector<LinkFlairRichtext> & get_mutable_link_flair_richtext() { return link_flair_richtext; }
        void set_link_flair_richtext(const std::vector<LinkFlairRichtext>& value) { this->link_flair_richtext = value; }

        const std::string & get_subreddit_name_prefixed() const { return subreddit_name_prefixed; }
        std::string & get_mutable_subreddit_name_prefixed() { return subreddit_name_prefixed; }
        void set_subreddit_name_prefixed(const std::string& value) { this->subreddit_name_prefixed = value; }

        const bool & get_hidden() const { return hidden; }
        bool & get_mutable_hidden() { return hidden; }
        void set_hidden(const bool& value) { this->hidden = value; }

        const int64_t & get_pwls() const { return pwls; }
        int64_t & get_mutable_pwls() { return pwls; }
        void set_pwls(const int64_t& value) { this->pwls = value; }

        std::shared_ptr<std::string> get_link_flair_css_class() const { return link_flair_css_class; }
        void set_link_flair_css_class(std::shared_ptr<std::string> value) { this->link_flair_css_class = value; }

        const int64_t & get_downs() const { return downs; }
        int64_t & get_mutable_downs() { return downs; }
        void set_downs(const int64_t& value) { this->downs = value; }

        std::shared_ptr<int64_t> get_thumbnail_height() const { return thumbnail_height; }
        void set_thumbnail_height(std::shared_ptr<int64_t> value) { this->thumbnail_height = value; }

        const WhitelistStatus & get_parent_whitelist_status() const { return parent_whitelist_status; }
        WhitelistStatus & get_mutable_parent_whitelist_status() { return parent_whitelist_status; }
        void set_parent_whitelist_status(const WhitelistStatus& value) { this->parent_whitelist_status = value; }

        const bool & get_hide_score() const { return hide_score; }
        bool & get_mutable_hide_score() { return hide_score; }
        void set_hide_score(const bool& value) { this->hide_score = value; }

        const std::string & get_name() const { return name; }
        std::string & get_mutable_name() { return name; }
        void set_name(const std::string& value) { this->name = value; }

        const bool & get_quarantine() const { return quarantine; }
        bool & get_mutable_quarantine() { return quarantine; }
        void set_quarantine(const bool& value) { this->quarantine = value; }

        const LinkFlairTextColor & get_link_flair_text_color() const { return link_flair_text_color; }
        LinkFlairTextColor & get_mutable_link_flair_text_color() { return link_flair_text_color; }
        void set_link_flair_text_color(const LinkFlairTextColor& value) { this->link_flair_text_color = value; }

        std::shared_ptr<std::string> get_author_flair_background_color() const { return author_flair_background_color; }
        void set_author_flair_background_color(std::shared_ptr<std::string> value) { this->author_flair_background_color = value; }

        const SubredditType & get_subreddit_type() const { return subreddit_type; }
        SubredditType & get_mutable_subreddit_type() { return subreddit_type; }
        void set_subreddit_type(const SubredditType& value) { this->subreddit_type = value; }

        const int64_t & get_ups() const { return ups; }
        int64_t & get_mutable_ups() { return ups; }
        void set_ups(const int64_t& value) { this->ups = value; }

        const std::string & get_domain() const { return domain; }
        std::string & get_mutable_domain() { return domain; }
        void set_domain(const std::string& value) { this->domain = value; }

        const MediaEmbed & get_media_embed() const { return media_embed; }
        MediaEmbed & get_mutable_media_embed() { return media_embed; }
        void set_media_embed(const MediaEmbed& value) { this->media_embed = value; }

        std::shared_ptr<int64_t> get_thumbnail_width() const { return thumbnail_width; }
        void set_thumbnail_width(std::shared_ptr<int64_t> value) { this->thumbnail_width = value; }

        const nlohmann::json & get_author_flair_template_id() const { return author_flair_template_id; }
        nlohmann::json & get_mutable_author_flair_template_id() { return author_flair_template_id; }
        void set_author_flair_template_id(const nlohmann::json& value) { this->author_flair_template_id = value; }

        const bool & get_is_original_content() const { return is_original_content; }
        bool & get_mutable_is_original_content() { return is_original_content; }
        void set_is_original_content(const bool& value) { this->is_original_content = value; }

        const nlohmann::json & get_secure_media() const { return secure_media; }
        nlohmann::json & get_mutable_secure_media() { return secure_media; }
        void set_secure_media(const nlohmann::json& value) { this->secure_media = value; }

        const bool & get_is_reddit_media_domain() const { return is_reddit_media_domain; }
        bool & get_mutable_is_reddit_media_domain() { return is_reddit_media_domain; }
        void set_is_reddit_media_domain(const bool& value) { this->is_reddit_media_domain = value; }

        const bool & get_is_meta() const { return is_meta; }
        bool & get_mutable_is_meta() { return is_meta; }
        void set_is_meta(const bool& value) { this->is_meta = value; }

        const nlohmann::json & get_category() const { return category; }
        nlohmann::json & get_mutable_category() { return category; }
        void set_category(const nlohmann::json& value) { this->category = value; }

        const MediaEmbed & get_secure_media_embed() const { return secure_media_embed; }
        MediaEmbed & get_mutable_secure_media_embed() { return secure_media_embed; }
        void set_secure_media_embed(const MediaEmbed& value) { this->secure_media_embed = value; }

        std::shared_ptr<std::string> get_link_flair_text() const { return link_flair_text; }
        void set_link_flair_text(std::shared_ptr<std::string> value) { this->link_flair_text = value; }

        const bool & get_can_mod_post() const { return can_mod_post; }
        bool & get_mutable_can_mod_post() { return can_mod_post; }
        void set_can_mod_post(const bool& value) { this->can_mod_post = value; }

        const int64_t & get_score() const { return score; }
        int64_t & get_mutable_score() { return score; }
        void set_score(const int64_t& value) { this->score = value; }

        const nlohmann::json & get_approved_by() const { return approved_by; }
        nlohmann::json & get_mutable_approved_by() { return approved_by; }
        void set_approved_by(const nlohmann::json& value) { this->approved_by = value; }

        const std::string & get_thumbnail() const { return thumbnail; }
        std::string & get_mutable_thumbnail() { return thumbnail; }
        void set_thumbnail(const std::string& value) { this->thumbnail = value; }

        const Edited & get_edited() const { return edited; }
        Edited & get_mutable_edited() { return edited; }
        void set_edited(const Edited& value) { this->edited = value; }

        std::shared_ptr<std::string> get_author_flair_css_class() const { return author_flair_css_class; }
        void set_author_flair_css_class(std::shared_ptr<std::string> value) { this->author_flair_css_class = value; }

        const std::vector<AuthorFlairRichtext> & get_author_flair_richtext() const { return author_flair_richtext; }
        std::vector<AuthorFlairRichtext> & get_mutable_author_flair_richtext() { return author_flair_richtext; }
        void set_author_flair_richtext(const std::vector<AuthorFlairRichtext>& value) { this->author_flair_richtext = value; }

        std::shared_ptr<PostHint> get_post_hint() const { return post_hint; }
        void set_post_hint(std::shared_ptr<PostHint> value) { this->post_hint = value; }

        std::shared_ptr<std::vector<std::string>> get_content_categories() const { return content_categories; }
        void set_content_categories(std::shared_ptr<std::vector<std::string>> value) { this->content_categories = value; }

        const bool & get_is_self() const { return is_self; }
        bool & get_mutable_is_self() { return is_self; }
        void set_is_self(const bool& value) { this->is_self = value; }

        const nlohmann::json & get_mod_note() const { return mod_note; }
        nlohmann::json & get_mutable_mod_note() { return mod_note; }
        void set_mod_note(const nlohmann::json& value) { this->mod_note = value; }

        const double & get_created() const { return created; }
        double & get_mutable_created() { return created; }
        void set_created(const double& value) { this->created = value; }

        const FlairType & get_link_flair_type() const { return link_flair_type; }
        FlairType & get_mutable_link_flair_type() { return link_flair_type; }
        void set_link_flair_type(const FlairType& value) { this->link_flair_type = value; }

        const int64_t & get_wls() const { return wls; }
        int64_t & get_mutable_wls() { return wls; }
        void set_wls(const int64_t& value) { this->wls = value; }

        const nlohmann::json & get_banned_by() const { return banned_by; }
        nlohmann::json & get_mutable_banned_by() { return banned_by; }
        void set_banned_by(const nlohmann::json& value) { this->banned_by = value; }

        const FlairType & get_author_flair_type() const { return author_flair_type; }
        FlairType & get_mutable_author_flair_type() { return author_flair_type; }
        void set_author_flair_type(const FlairType& value) { this->author_flair_type = value; }

        const bool & get_contest_mode() const { return contest_mode; }
        bool & get_mutable_contest_mode() { return contest_mode; }
        void set_contest_mode(const bool& value) { this->contest_mode = value; }

        std::shared_ptr<std::string> get_selftext_html() const { return selftext_html; }
        void set_selftext_html(std::shared_ptr<std::string> value) { this->selftext_html = value; }

        const nlohmann::json & get_likes() const { return likes; }
        nlohmann::json & get_mutable_likes() { return likes; }
        void set_likes(const nlohmann::json& value) { this->likes = value; }

        std::shared_ptr<std::string> get_suggested_sort() const { return suggested_sort; }
        void set_suggested_sort(std::shared_ptr<std::string> value) { this->suggested_sort = value; }

        const nlohmann::json & get_banned_at_utc() const { return banned_at_utc; }
        nlohmann::json & get_mutable_banned_at_utc() { return banned_at_utc; }
        void set_banned_at_utc(const nlohmann::json& value) { this->banned_at_utc = value; }

        const nlohmann::json & get_view_count() const { return view_count; }
        nlohmann::json & get_mutable_view_count() { return view_count; }
        void set_view_count(const nlohmann::json& value) { this->view_count = value; }

        const bool & get_archived() const { return archived; }
        bool & get_mutable_archived() { return archived; }
        void set_archived(const bool& value) { this->archived = value; }

        const bool & get_no_follow() const { return no_follow; }
        bool & get_mutable_no_follow() { return no_follow; }
        void set_no_follow(const bool& value) { this->no_follow = value; }

        const bool & get_is_crosspostable() const { return is_crosspostable; }
        bool & get_mutable_is_crosspostable() { return is_crosspostable; }
        void set_is_crosspostable(const bool& value) { this->is_crosspostable = value; }

        const bool & get_pinned() const { return pinned; }
        bool & get_mutable_pinned() { return pinned; }
        void set_pinned(const bool& value) { this->pinned = value; }

        const bool & get_over_18() const { return over_18; }
        bool & get_mutable_over_18() { return over_18; }
        void set_over_18(const bool& value) { this->over_18 = value; }

        std::shared_ptr<Preview> get_preview() const { return preview; }
        void set_preview(std::shared_ptr<Preview> value) { this->preview = value; }

        const bool & get_media_only() const { return media_only; }
        bool & get_mutable_media_only() { return media_only; }
        void set_media_only(const bool& value) { this->media_only = value; }

        std::shared_ptr<std::string> get_link_flair_template_id() const { return link_flair_template_id; }
        void set_link_flair_template_id(std::shared_ptr<std::string> value) { this->link_flair_template_id = value; }

        const bool & get_can_gild() const { return can_gild; }
        bool & get_mutable_can_gild() { return can_gild; }
        void set_can_gild(const bool& value) { this->can_gild = value; }

        const bool & get_spoiler() const { return spoiler; }
        bool & get_mutable_spoiler() { return spoiler; }
        void set_spoiler(const bool& value) { this->spoiler = value; }

        const bool & get_locked() const { return locked; }
        bool & get_mutable_locked() { return locked; }
        void set_locked(const bool& value) { this->locked = value; }

        std::shared_ptr<std::string> get_author_flair_text() const { return author_flair_text; }
        void set_author_flair_text(std::shared_ptr<std::string> value) { this->author_flair_text = value; }

        const bool & get_visited() const { return visited; }
        bool & get_mutable_visited() { return visited; }
        void set_visited(const bool& value) { this->visited = value; }

        const nlohmann::json & get_num_reports() const { return num_reports; }
        nlohmann::json & get_mutable_num_reports() { return num_reports; }
        void set_num_reports(const nlohmann::json& value) { this->num_reports = value; }

        const nlohmann::json & get_distinguished() const { return distinguished; }
        nlohmann::json & get_mutable_distinguished() { return distinguished; }
        void set_distinguished(const nlohmann::json& value) { this->distinguished = value; }

        const std::string & get_subreddit_id() const { return subreddit_id; }
        std::string & get_mutable_subreddit_id() { return subreddit_id; }
        void set_subreddit_id(const std::string& value) { this->subreddit_id = value; }

        const nlohmann::json & get_mod_reason_by() const { return mod_reason_by; }
        nlohmann::json & get_mutable_mod_reason_by() { return mod_reason_by; }
        void set_mod_reason_by(const nlohmann::json& value) { this->mod_reason_by = value; }

        const nlohmann::json & get_removal_reason() const { return removal_reason; }
        nlohmann::json & get_mutable_removal_reason() { return removal_reason; }
        void set_removal_reason(const nlohmann::json& value) { this->removal_reason = value; }

        const LinkFlairBackgroundColor & get_link_flair_background_color() const { return link_flair_background_color; }
        LinkFlairBackgroundColor & get_mutable_link_flair_background_color() { return link_flair_background_color; }
        void set_link_flair_background_color(const LinkFlairBackgroundColor& value) { this->link_flair_background_color = value; }

        const std::string & get_id() const { return id; }
        std::string & get_mutable_id() { return id; }
        void set_id(const std::string& value) { this->id = value; }

        const nlohmann::json & get_report_reasons() const { return report_reasons; }
        nlohmann::json & get_mutable_report_reasons() { return report_reasons; }
        void set_report_reasons(const nlohmann::json& value) { this->report_reasons = value; }

        const std::string & get_author() const { return author; }
        std::string & get_mutable_author() { return author; }
        void set_author(const std::string& value) { this->author = value; }

        const int64_t & get_num_crossposts() const { return num_crossposts; }
        int64_t & get_mutable_num_crossposts() { return num_crossposts; }
        void set_num_crossposts(const int64_t& value) { this->num_crossposts = value; }

        const int64_t & get_num_comments() const { return num_comments; }
        int64_t & get_mutable_num_comments() { return num_comments; }
        void set_num_comments(const int64_t& value) { this->num_comments = value; }

        const bool & get_send_replies() const { return send_replies; }
        bool & get_mutable_send_replies() { return send_replies; }
        void set_send_replies(const bool& value) { this->send_replies = value; }

        const std::vector<nlohmann::json> & get_mod_reports() const { return mod_reports; }
        std::vector<nlohmann::json> & get_mutable_mod_reports() { return mod_reports; }
        void set_mod_reports(const std::vector<nlohmann::json>& value) { this->mod_reports = value; }

        std::shared_ptr<std::string> get_author_flair_text_color() const { return author_flair_text_color; }
        void set_author_flair_text_color(std::shared_ptr<std::string> value) { this->author_flair_text_color = value; }

        const std::string & get_permalink() const { return permalink; }
        std::string & get_mutable_permalink() { return permalink; }
        void set_permalink(const std::string& value) { this->permalink = value; }

        const WhitelistStatus & get_whitelist_status() const { return whitelist_status; }
        WhitelistStatus & get_mutable_whitelist_status() { return whitelist_status; }
        void set_whitelist_status(const WhitelistStatus& value) { this->whitelist_status = value; }

        const bool & get_stickied() const { return stickied; }
        bool & get_mutable_stickied() { return stickied; }
        void set_stickied(const bool& value) { this->stickied = value; }

        const std::string & get_url() const { return url; }
        std::string & get_mutable_url() { return url; }
        void set_url(const std::string& value) { this->url = value; }

        const int64_t & get_subreddit_subscribers() const { return subreddit_subscribers; }
        int64_t & get_mutable_subreddit_subscribers() { return subreddit_subscribers; }
        void set_subreddit_subscribers(const int64_t& value) { this->subreddit_subscribers = value; }

        const double & get_created_utc() const { return created_utc; }
        double & get_mutable_created_utc() { return created_utc; }
        void set_created_utc(const double& value) { this->created_utc = value; }

        const nlohmann::json & get_media() const { return media; }
        nlohmann::json & get_mutable_media() { return media; }
        void set_media(const nlohmann::json& value) { this->media = value; }

        const bool & get_is_video() const { return is_video; }
        bool & get_mutable_is_video() { return is_video; }
        void set_is_video(const bool& value) { this->is_video = value; }
    };

    enum class Kind : int { T3 };

    class Child {
        public:
        Child() = default;
        virtual ~Child() = default;

        private:
        Kind kind;
        ChildData data;

        public:
        const Kind & get_kind() const { return kind; }
        Kind & get_mutable_kind() { return kind; }
        void set_kind(const Kind& value) { this->kind = value; }

        const ChildData & get_data() const { return data; }
        ChildData & get_mutable_data() { return data; }
        void set_data(const ChildData& value) { this->data = value; }
    };

    class RedditData {
        public:
        RedditData() = default;
        virtual ~RedditData() = default;

        private:
        std::string modhash;
        int64_t dist;
        std::vector<Child> children;
        std::string after;
        nlohmann::json before;

        public:
        const std::string & get_modhash() const { return modhash; }
        std::string & get_mutable_modhash() { return modhash; }
        void set_modhash(const std::string& value) { this->modhash = value; }

        const int64_t & get_dist() const { return dist; }
        int64_t & get_mutable_dist() { return dist; }
        void set_dist(const int64_t& value) { this->dist = value; }

        const std::vector<Child> & get_children() const { return children; }
        std::vector<Child> & get_mutable_children() { return children; }
        void set_children(const std::vector<Child>& value) { this->children = value; }

        const std::string & get_after() const { return after; }
        std::string & get_mutable_after() { return after; }
        void set_after(const std::string& value) { this->after = value; }

        const nlohmann::json & get_before() const { return before; }
        nlohmann::json & get_mutable_before() { return before; }
        void set_before(const nlohmann::json& value) { this->before = value; }
    };

    class Reddit {
        public:
        Reddit() = default;
        virtual ~Reddit() = default;

        private:
        std::string kind;
        RedditData data;

        public:
        const std::string & get_kind() const { return kind; }
        std::string & get_mutable_kind() { return kind; }
        void set_kind(const std::string& value) { this->kind = value; }

        const RedditData & get_data() const { return data; }
        RedditData & get_mutable_data() { return data; }
        void set_data(const RedditData& value) { this->data = value; }
    };
}

namespace nlohmann {
    inline void from_json(const json& _j, quicktype::AuthorFlairRichtext& _x) {
        _x.set_e( _j.at("e").get<std::string>() );
        _x.set_t( _j.at("t").get<std::string>() );
    }

    inline void to_json(json& _j, const quicktype::AuthorFlairRichtext& _x) {
        _j = json::object();
        _j["e"] = _x.get_e();
        _j["t"] = _x.get_t();
    }

    inline void from_json(const json& _j, quicktype::LinkFlairRichtext& _x) {
        _x.set_e( _j.at("e").get<std::string>() );
        _x.set_t( quicktype::get_optional<std::string>(_j, "t") );
        _x.set_a( quicktype::get_optional<std::string>(_j, "a") );
        _x.set_u( quicktype::get_optional<std::string>(_j, "u") );
    }

    inline void to_json(json& _j, const quicktype::LinkFlairRichtext& _x) {
        _j = json::object();
        _j["e"] = _x.get_e();
        _j["t"] = _x.get_t();
        _j["a"] = _x.get_a();
        _j["u"] = _x.get_u();
    }

    inline void from_json(const json& _j, quicktype::MediaEmbed& _x) {
    }

    inline void to_json(json& _j, const quicktype::MediaEmbed& _x) {
        _j = json::object();
    }

    inline void from_json(const json& _j, quicktype::Source& _x) {
        _x.set_url( _j.at("url").get<std::string>() );
        _x.set_width( _j.at("width").get<int64_t>() );
        _x.set_height( _j.at("height").get<int64_t>() );
    }

    inline void to_json(json& _j, const quicktype::Source& _x) {
        _j = json::object();
        _j["url"] = _x.get_url();
        _j["width"] = _x.get_width();
        _j["height"] = _x.get_height();
    }

    inline void from_json(const json& _j, quicktype::Gif& _x) {
        _x.set_source( _j.at("source").get<quicktype::Source>() );
        _x.set_resolutions( _j.at("resolutions").get<std::vector<quicktype::Source>>() );
    }

    inline void to_json(json& _j, const quicktype::Gif& _x) {
        _j = json::object();
        _j["source"] = _x.get_source();
        _j["resolutions"] = _x.get_resolutions();
    }

    inline void from_json(const json& _j, quicktype::Variants& _x) {
        _x.set_gif( quicktype::get_optional<quicktype::Gif>(_j, "gif") );
        _x.set_mp4( quicktype::get_optional<quicktype::Gif>(_j, "mp4") );
    }

    inline void to_json(json& _j, const quicktype::Variants& _x) {
        _j = json::object();
        _j["gif"] = _x.get_gif();
        _j["mp4"] = _x.get_mp4();
    }

    inline void from_json(const json& _j, quicktype::Image& _x) {
        _x.set_source( _j.at("source").get<quicktype::Source>() );
        _x.set_resolutions( _j.at("resolutions").get<std::vector<quicktype::Source>>() );
        _x.set_variants( _j.at("variants").get<quicktype::Variants>() );
        _x.set_id( _j.at("id").get<std::string>() );
    }

    inline void to_json(json& _j, const quicktype::Image& _x) {
        _j = json::object();
        _j["source"] = _x.get_source();
        _j["resolutions"] = _x.get_resolutions();
        _j["variants"] = _x.get_variants();
        _j["id"] = _x.get_id();
    }

    inline void from_json(const json& _j, quicktype::RedditVideoPreview& _x) {
        _x.set_fallback_url( _j.at("fallback_url").get<std::string>() );
        _x.set_height( _j.at("height").get<int64_t>() );
        _x.set_width( _j.at("width").get<int64_t>() );
        _x.set_scrubber_media_url( _j.at("scrubber_media_url").get<std::string>() );
        _x.set_dash_url( _j.at("dash_url").get<std::string>() );
        _x.set_duration( _j.at("duration").get<int64_t>() );
        _x.set_hls_url( _j.at("hls_url").get<std::string>() );
        _x.set_is_gif( _j.at("is_gif").get<bool>() );
        _x.set_transcoding_status( _j.at("transcoding_status").get<std::string>() );
    }

    inline void to_json(json& _j, const quicktype::RedditVideoPreview& _x) {
        _j = json::object();
        _j["fallback_url"] = _x.get_fallback_url();
        _j["height"] = _x.get_height();
        _j["width"] = _x.get_width();
        _j["scrubber_media_url"] = _x.get_scrubber_media_url();
        _j["dash_url"] = _x.get_dash_url();
        _j["duration"] = _x.get_duration();
        _j["hls_url"] = _x.get_hls_url();
        _j["is_gif"] = _x.get_is_gif();
        _j["transcoding_status"] = _x.get_transcoding_status();
    }

    inline void from_json(const json& _j, quicktype::Preview& _x) {
        _x.set_images( _j.at("images").get<std::vector<quicktype::Image>>() );
        _x.set_enabled( _j.at("enabled").get<bool>() );
        _x.set_reddit_video_preview( quicktype::get_optional<quicktype::RedditVideoPreview>(_j, "reddit_video_preview") );
    }

    inline void to_json(json& _j, const quicktype::Preview& _x) {
        _j = json::object();
        _j["images"] = _x.get_images();
        _j["enabled"] = _x.get_enabled();
        _j["reddit_video_preview"] = _x.get_reddit_video_preview();
    }

    inline void from_json(const json& _j, quicktype::ChildData& _x) {
        _x.set_approved_at_utc( quicktype::get_untyped(_j, "approved_at_utc") );
        _x.set_subreddit( _j.at("subreddit").get<std::string>() );
        _x.set_selftext( _j.at("selftext").get<std::string>() );
        _x.set_user_reports( _j.at("user_reports").get<std::vector<json>>() );
        _x.set_saved( _j.at("saved").get<bool>() );
        _x.set_mod_reason_title( quicktype::get_untyped(_j, "mod_reason_title") );
        _x.set_gilded( _j.at("gilded").get<int64_t>() );
        _x.set_clicked( _j.at("clicked").get<bool>() );
        _x.set_title( _j.at("title").get<std::string>() );
        _x.set_link_flair_richtext( _j.at("link_flair_richtext").get<std::vector<quicktype::LinkFlairRichtext>>() );
        _x.set_subreddit_name_prefixed( _j.at("subreddit_name_prefixed").get<std::string>() );
        _x.set_hidden( _j.at("hidden").get<bool>() );
        _x.set_pwls( _j.at("pwls").get<int64_t>() );
        _x.set_link_flair_css_class( quicktype::get_optional<std::string>(_j, "link_flair_css_class") );
        _x.set_downs( _j.at("downs").get<int64_t>() );
        _x.set_thumbnail_height( quicktype::get_optional<int64_t>(_j, "thumbnail_height") );
        _x.set_parent_whitelist_status( _j.at("parent_whitelist_status").get<quicktype::WhitelistStatus>() );
        _x.set_hide_score( _j.at("hide_score").get<bool>() );
        _x.set_name( _j.at("name").get<std::string>() );
        _x.set_quarantine( _j.at("quarantine").get<bool>() );
        _x.set_link_flair_text_color( _j.at("link_flair_text_color").get<quicktype::LinkFlairTextColor>() );
        _x.set_author_flair_background_color( quicktype::get_optional<std::string>(_j, "author_flair_background_color") );
        _x.set_subreddit_type( _j.at("subreddit_type").get<quicktype::SubredditType>() );
        _x.set_ups( _j.at("ups").get<int64_t>() );
        _x.set_domain( _j.at("domain").get<std::string>() );
        _x.set_media_embed( _j.at("media_embed").get<quicktype::MediaEmbed>() );
        _x.set_thumbnail_width( quicktype::get_optional<int64_t>(_j, "thumbnail_width") );
        _x.set_author_flair_template_id( quicktype::get_untyped(_j, "author_flair_template_id") );
        _x.set_is_original_content( _j.at("is_original_content").get<bool>() );
        _x.set_secure_media( quicktype::get_untyped(_j, "secure_media") );
        _x.set_is_reddit_media_domain( _j.at("is_reddit_media_domain").get<bool>() );
        _x.set_is_meta( _j.at("is_meta").get<bool>() );
        _x.set_category( quicktype::get_untyped(_j, "category") );
        _x.set_secure_media_embed( _j.at("secure_media_embed").get<quicktype::MediaEmbed>() );
        _x.set_link_flair_text( quicktype::get_optional<std::string>(_j, "link_flair_text") );
        _x.set_can_mod_post( _j.at("can_mod_post").get<bool>() );
        _x.set_score( _j.at("score").get<int64_t>() );
        _x.set_approved_by( quicktype::get_untyped(_j, "approved_by") );
        _x.set_thumbnail( _j.at("thumbnail").get<std::string>() );
        _x.set_edited( _j.at("edited").get<quicktype::Edited>() );
        _x.set_author_flair_css_class( quicktype::get_optional<std::string>(_j, "author_flair_css_class") );
        _x.set_author_flair_richtext( _j.at("author_flair_richtext").get<std::vector<quicktype::AuthorFlairRichtext>>() );
        _x.set_post_hint( quicktype::get_optional<quicktype::PostHint>(_j, "post_hint") );
        _x.set_content_categories( quicktype::get_optional<std::vector<std::string>>(_j, "content_categories") );
        _x.set_is_self( _j.at("is_self").get<bool>() );
        _x.set_mod_note( quicktype::get_untyped(_j, "mod_note") );
        _x.set_created( _j.at("created").get<double>() );
        _x.set_link_flair_type( _j.at("link_flair_type").get<quicktype::FlairType>() );
        _x.set_wls( _j.at("wls").get<int64_t>() );
        _x.set_banned_by( quicktype::get_untyped(_j, "banned_by") );
        _x.set_author_flair_type( _j.at("author_flair_type").get<quicktype::FlairType>() );
        _x.set_contest_mode( _j.at("contest_mode").get<bool>() );
        _x.set_selftext_html( quicktype::get_optional<std::string>(_j, "selftext_html") );
        _x.set_likes( quicktype::get_untyped(_j, "likes") );
        _x.set_suggested_sort( quicktype::get_optional<std::string>(_j, "suggested_sort") );
        _x.set_banned_at_utc( quicktype::get_untyped(_j, "banned_at_utc") );
        _x.set_view_count( quicktype::get_untyped(_j, "view_count") );
        _x.set_archived( _j.at("archived").get<bool>() );
        _x.set_no_follow( _j.at("no_follow").get<bool>() );
        _x.set_is_crosspostable( _j.at("is_crosspostable").get<bool>() );
        _x.set_pinned( _j.at("pinned").get<bool>() );
        _x.set_over_18( _j.at("over_18").get<bool>() );
        _x.set_preview( quicktype::get_optional<quicktype::Preview>(_j, "preview") );
        _x.set_media_only( _j.at("media_only").get<bool>() );
        _x.set_link_flair_template_id( quicktype::get_optional<std::string>(_j, "link_flair_template_id") );
        _x.set_can_gild( _j.at("can_gild").get<bool>() );
        _x.set_spoiler( _j.at("spoiler").get<bool>() );
        _x.set_locked( _j.at("locked").get<bool>() );
        _x.set_author_flair_text( quicktype::get_optional<std::string>(_j, "author_flair_text") );
        _x.set_visited( _j.at("visited").get<bool>() );
        _x.set_num_reports( quicktype::get_untyped(_j, "num_reports") );
        _x.set_distinguished( quicktype::get_untyped(_j, "distinguished") );
        _x.set_subreddit_id( _j.at("subreddit_id").get<std::string>() );
        _x.set_mod_reason_by( quicktype::get_untyped(_j, "mod_reason_by") );
        _x.set_removal_reason( quicktype::get_untyped(_j, "removal_reason") );
        _x.set_link_flair_background_color( _j.at("link_flair_background_color").get<quicktype::LinkFlairBackgroundColor>() );
        _x.set_id( _j.at("id").get<std::string>() );
        _x.set_report_reasons( quicktype::get_untyped(_j, "report_reasons") );
        _x.set_author( _j.at("author").get<std::string>() );
        _x.set_num_crossposts( _j.at("num_crossposts").get<int64_t>() );
        _x.set_num_comments( _j.at("num_comments").get<int64_t>() );
        _x.set_send_replies( _j.at("send_replies").get<bool>() );
        _x.set_mod_reports( _j.at("mod_reports").get<std::vector<json>>() );
        _x.set_author_flair_text_color( quicktype::get_optional<std::string>(_j, "author_flair_text_color") );
        _x.set_permalink( _j.at("permalink").get<std::string>() );
        _x.set_whitelist_status( _j.at("whitelist_status").get<quicktype::WhitelistStatus>() );
        _x.set_stickied( _j.at("stickied").get<bool>() );
        _x.set_url( _j.at("url").get<std::string>() );
        _x.set_subreddit_subscribers( _j.at("subreddit_subscribers").get<int64_t>() );
        _x.set_created_utc( _j.at("created_utc").get<double>() );
        _x.set_media( quicktype::get_untyped(_j, "media") );
        _x.set_is_video( _j.at("is_video").get<bool>() );
    }

    inline void to_json(json& _j, const quicktype::ChildData& _x) {
        _j = json::object();
        _j["approved_at_utc"] = _x.get_approved_at_utc();
        _j["subreddit"] = _x.get_subreddit();
        _j["selftext"] = _x.get_selftext();
        _j["user_reports"] = _x.get_user_reports();
        _j["saved"] = _x.get_saved();
        _j["mod_reason_title"] = _x.get_mod_reason_title();
        _j["gilded"] = _x.get_gilded();
        _j["clicked"] = _x.get_clicked();
        _j["title"] = _x.get_title();
        _j["link_flair_richtext"] = _x.get_link_flair_richtext();
        _j["subreddit_name_prefixed"] = _x.get_subreddit_name_prefixed();
        _j["hidden"] = _x.get_hidden();
        _j["pwls"] = _x.get_pwls();
        _j["link_flair_css_class"] = _x.get_link_flair_css_class();
        _j["downs"] = _x.get_downs();
        _j["thumbnail_height"] = _x.get_thumbnail_height();
        _j["parent_whitelist_status"] = _x.get_parent_whitelist_status();
        _j["hide_score"] = _x.get_hide_score();
        _j["name"] = _x.get_name();
        _j["quarantine"] = _x.get_quarantine();
        _j["link_flair_text_color"] = _x.get_link_flair_text_color();
        _j["author_flair_background_color"] = _x.get_author_flair_background_color();
        _j["subreddit_type"] = _x.get_subreddit_type();
        _j["ups"] = _x.get_ups();
        _j["domain"] = _x.get_domain();
        _j["media_embed"] = _x.get_media_embed();
        _j["thumbnail_width"] = _x.get_thumbnail_width();
        _j["author_flair_template_id"] = _x.get_author_flair_template_id();
        _j["is_original_content"] = _x.get_is_original_content();
        _j["secure_media"] = _x.get_secure_media();
        _j["is_reddit_media_domain"] = _x.get_is_reddit_media_domain();
        _j["is_meta"] = _x.get_is_meta();
        _j["category"] = _x.get_category();
        _j["secure_media_embed"] = _x.get_secure_media_embed();
        _j["link_flair_text"] = _x.get_link_flair_text();
        _j["can_mod_post"] = _x.get_can_mod_post();
        _j["score"] = _x.get_score();
        _j["approved_by"] = _x.get_approved_by();
        _j["thumbnail"] = _x.get_thumbnail();
        _j["edited"] = _x.get_edited();
        _j["author_flair_css_class"] = _x.get_author_flair_css_class();
        _j["author_flair_richtext"] = _x.get_author_flair_richtext();
        _j["post_hint"] = _x.get_post_hint();
        _j["content_categories"] = _x.get_content_categories();
        _j["is_self"] = _x.get_is_self();
        _j["mod_note"] = _x.get_mod_note();
        _j["created"] = _x.get_created();
        _j["link_flair_type"] = _x.get_link_flair_type();
        _j["wls"] = _x.get_wls();
        _j["banned_by"] = _x.get_banned_by();
        _j["author_flair_type"] = _x.get_author_flair_type();
        _j["contest_mode"] = _x.get_contest_mode();
        _j["selftext_html"] = _x.get_selftext_html();
        _j["likes"] = _x.get_likes();
        _j["suggested_sort"] = _x.get_suggested_sort();
        _j["banned_at_utc"] = _x.get_banned_at_utc();
        _j["view_count"] = _x.get_view_count();
        _j["archived"] = _x.get_archived();
        _j["no_follow"] = _x.get_no_follow();
        _j["is_crosspostable"] = _x.get_is_crosspostable();
        _j["pinned"] = _x.get_pinned();
        _j["over_18"] = _x.get_over_18();
        _j["preview"] = _x.get_preview();
        _j["media_only"] = _x.get_media_only();
        _j["link_flair_template_id"] = _x.get_link_flair_template_id();
        _j["can_gild"] = _x.get_can_gild();
        _j["spoiler"] = _x.get_spoiler();
        _j["locked"] = _x.get_locked();
        _j["author_flair_text"] = _x.get_author_flair_text();
        _j["visited"] = _x.get_visited();
        _j["num_reports"] = _x.get_num_reports();
        _j["distinguished"] = _x.get_distinguished();
        _j["subreddit_id"] = _x.get_subreddit_id();
        _j["mod_reason_by"] = _x.get_mod_reason_by();
        _j["removal_reason"] = _x.get_removal_reason();
        _j["link_flair_background_color"] = _x.get_link_flair_background_color();
        _j["id"] = _x.get_id();
        _j["report_reasons"] = _x.get_report_reasons();
        _j["author"] = _x.get_author();
        _j["num_crossposts"] = _x.get_num_crossposts();
        _j["num_comments"] = _x.get_num_comments();
        _j["send_replies"] = _x.get_send_replies();
        _j["mod_reports"] = _x.get_mod_reports();
        _j["author_flair_text_color"] = _x.get_author_flair_text_color();
        _j["permalink"] = _x.get_permalink();
        _j["whitelist_status"] = _x.get_whitelist_status();
        _j["stickied"] = _x.get_stickied();
        _j["url"] = _x.get_url();
        _j["subreddit_subscribers"] = _x.get_subreddit_subscribers();
        _j["created_utc"] = _x.get_created_utc();
        _j["media"] = _x.get_media();
        _j["is_video"] = _x.get_is_video();
    }

    inline void from_json(const json& _j, quicktype::Child& _x) {
        _x.set_kind( _j.at("kind").get<quicktype::Kind>() );
        _x.set_data( _j.at("data").get<quicktype::ChildData>() );
    }

    inline void to_json(json& _j, const quicktype::Child& _x) {
        _j = json::object();
        _j["kind"] = _x.get_kind();
        _j["data"] = _x.get_data();
    }

    inline void from_json(const json& _j, quicktype::RedditData& _x) {
        _x.set_modhash( _j.at("modhash").get<std::string>() );
        _x.set_dist( _j.at("dist").get<int64_t>() );
        _x.set_children( _j.at("children").get<std::vector<quicktype::Child>>() );
        _x.set_after( _j.at("after").get<std::string>() );
        _x.set_before( quicktype::get_untyped(_j, "before") );
    }

    inline void to_json(json& _j, const quicktype::RedditData& _x) {
        _j = json::object();
        _j["modhash"] = _x.get_modhash();
        _j["dist"] = _x.get_dist();
        _j["children"] = _x.get_children();
        _j["after"] = _x.get_after();
        _j["before"] = _x.get_before();
    }

    inline void from_json(const json& _j, quicktype::Reddit& _x) {
        _x.set_kind( _j.at("kind").get<std::string>() );
        _x.set_data( _j.at("data").get<quicktype::RedditData>() );
    }

    inline void to_json(json& _j, const quicktype::Reddit& _x) {
        _j = json::object();
        _j["kind"] = _x.get_kind();
        _j["data"] = _x.get_data();
    }

    inline void from_json(const json& _j, quicktype::FlairType& _x) {
        if (_j == "richtext") _x = quicktype::FlairType::RICHTEXT;
        else if (_j == "text") _x = quicktype::FlairType::TEXT;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::FlairType& _x) {
        switch (_x) {
            case quicktype::FlairType::RICHTEXT: _j = "richtext"; break;
            case quicktype::FlairType::TEXT: _j = "text"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::LinkFlairBackgroundColor& _x) {
        if (_j == "") _x = quicktype::LinkFlairBackgroundColor::EMPTY;
        else if (_j == "#ff4500") _x = quicktype::LinkFlairBackgroundColor::FF4500;
        else if (_j == "#6289d1") _x = quicktype::LinkFlairBackgroundColor::THE_6289_D1;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::LinkFlairBackgroundColor& _x) {
        switch (_x) {
            case quicktype::LinkFlairBackgroundColor::EMPTY: _j = ""; break;
            case quicktype::LinkFlairBackgroundColor::FF4500: _j = "#ff4500"; break;
            case quicktype::LinkFlairBackgroundColor::THE_6289_D1: _j = "#6289d1"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::LinkFlairTextColor& _x) {
        if (_j == "dark") _x = quicktype::LinkFlairTextColor::DARK;
        else if (_j == "light") _x = quicktype::LinkFlairTextColor::LIGHT;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::LinkFlairTextColor& _x) {
        switch (_x) {
            case quicktype::LinkFlairTextColor::DARK: _j = "dark"; break;
            case quicktype::LinkFlairTextColor::LIGHT: _j = "light"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::WhitelistStatus& _x) {
        if (_j == "all_ads") _x = quicktype::WhitelistStatus::ALL_ADS;
        else if (_j == "house_only") _x = quicktype::WhitelistStatus::HOUSE_ONLY;
        else if (_j == "promo_all") _x = quicktype::WhitelistStatus::PROMO_ALL;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::WhitelistStatus& _x) {
        switch (_x) {
            case quicktype::WhitelistStatus::ALL_ADS: _j = "all_ads"; break;
            case quicktype::WhitelistStatus::HOUSE_ONLY: _j = "house_only"; break;
            case quicktype::WhitelistStatus::PROMO_ALL: _j = "promo_all"; break;
            default: throw "This should not happen";
        }
    }

    inline void from_json(const json& _j, quicktype::PostHint& _x) {
        if (_j == "image") _x = quicktype::PostHint::IMAGE;
        else if (_j == "link") _x = quicktype::PostHint::LINK;
        else if (_j == "self") _x = quicktype::PostHint::SELF;
        else throw "Input JSON does not conform to schema";
    }

    inline void to_json(json& _j, const quicktype::PostHint& _x) {
        switch (_x) {
            case quicktype::PostHint::IMAGE: _j = "image"; break;
            case quicktype::PostHint::LINK: _j = "link"; break;
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
    inline void from_json(const json& _j, boost::variant<bool, double>& _x) {
        if (_j.is_boolean())
            _x = _j.get<bool>();
        else if (_j.is_number())
            _x = _j.get<double>();
        else throw "Could not deserialize";
    }

    inline void to_json(json& _j, const boost::variant<bool, double>& _x) {
        switch (_x.which()) {
            case 0:
                _j = boost::get<bool>(_x);
                break;
            case 1:
                _j = boost::get<double>(_x);
                break;
            default: throw "Input JSON does not conform to schema";
        }
    }
}
