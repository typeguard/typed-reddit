# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   reddit = Reddit.from_json! "{…}"
#   puts reddit.data.children.first.data.mod_reports.first
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int                      = Strict::Int
  Nil                      = Strict::Nil
  Bool                     = Strict::Bool
  Hash                     = Strict::Hash
  String                   = Strict::String
  Double                   = Strict::Float | Strict::Int
  FlairType                = Strict::String.enum("richtext", "text")
  LinkFlairBackgroundColor = Strict::String.enum("", "#ff4500", "#6289d1")
  LinkFlairTextColor       = Strict::String.enum("dark", "light")
  WhitelistStatus          = Strict::String.enum("all_ads", "house_only", "promo_all")
  PostHint                 = Strict::String.enum("image", "link", "self")
  SubredditType            = Strict::String.enum("public")
  Kind                     = Strict::String.enum("t3")
end

class AuthorFlairRichtext < Dry::Struct
  attribute :e, Types::String
  attribute :t, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      e: d.fetch("e"),
      t: d.fetch("t"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "e" => @e,
      "t" => @t,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module FlairType
  Richtext = "richtext"
  Text     = "text"
end

class Edited < Dry::Struct
  attribute :bool,   Types::Bool.optional
  attribute :double, Types::Double.optional

  def self.from_dynamic!(d)
    if schema[:bool].right.valid? d
      return new(bool: d, double: nil)
    end
    if schema[:double].right.valid? d
      return new(double: d, bool: nil)
    end
    raise "Invalid union"
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    if @bool != nil
      @bool
    elsif @double != nil
      @double
    end
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module LinkFlairBackgroundColor
  Empty     = ""
  Ff4500    = "#ff4500"
  The6289D1 = "#6289d1"
end

class LinkFlairRichtext < Dry::Struct
  attribute :e, Types::String
  attribute :t, Types::String.optional
  attribute :a, Types::String.optional
  attribute :u, Types::String.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      e: d.fetch("e"),
      t: d["t"],
      a: d["a"],
      u: d["u"],
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "e" => @e,
      "t" => @t,
      "a" => @a,
      "u" => @u,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module LinkFlairTextColor
  Dark  = "dark"
  Light = "light"
end

class MediaEmbed < Dry::Struct

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module WhitelistStatus
  AllAds    = "all_ads"
  HouseOnly = "house_only"
  PromoAll  = "promo_all"
end

module PostHint
  Image = "image"
  Link  = "link"
  Self  = "self"
end

class Source < Dry::Struct
  attribute :url,    Types::String
  attribute :width,  Types::Int
  attribute :height, Types::Int

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      url:    d.fetch("url"),
      width:  d.fetch("width"),
      height: d.fetch("height"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "url"    => @url,
      "width"  => @width,
      "height" => @height,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class GIF < Dry::Struct
  attribute :source,      Source
  attribute :resolutions, Types.Array(Source)

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      source:      Source.from_dynamic!(d.fetch("source")),
      resolutions: d.fetch("resolutions").map { |x| Source.from_dynamic!(x) },
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "source"      => @source.to_dynamic,
      "resolutions" => @resolutions.map { |x| x.to_dynamic },
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Variants < Dry::Struct
  attribute :gif, GIF.optional
  attribute :mp4, GIF.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      gif: d["gif"] ? GIF.from_dynamic!(d["gif"]) : nil,
      mp4: d["mp4"] ? GIF.from_dynamic!(d["mp4"]) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "gif" => @gif&.to_dynamic,
      "mp4" => @mp4&.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Image < Dry::Struct
  attribute :source,      Source
  attribute :resolutions, Types.Array(Source)
  attribute :variants,    Variants
  attribute :id,          Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      source:      Source.from_dynamic!(d.fetch("source")),
      resolutions: d.fetch("resolutions").map { |x| Source.from_dynamic!(x) },
      variants:    Variants.from_dynamic!(d.fetch("variants")),
      id:          d.fetch("id"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "source"      => @source.to_dynamic,
      "resolutions" => @resolutions.map { |x| x.to_dynamic },
      "variants"    => @variants.to_dynamic,
      "id"          => @id,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class RedditVideoPreview < Dry::Struct
  attribute :fallback_url,       Types::String
  attribute :height,             Types::Int
  attribute :width,              Types::Int
  attribute :scrubber_media_url, Types::String
  attribute :dash_url,           Types::String
  attribute :duration,           Types::Int
  attribute :hls_url,            Types::String
  attribute :is_gif,             Types::Bool
  attribute :transcoding_status, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      fallback_url:       d.fetch("fallback_url"),
      height:             d.fetch("height"),
      width:              d.fetch("width"),
      scrubber_media_url: d.fetch("scrubber_media_url"),
      dash_url:           d.fetch("dash_url"),
      duration:           d.fetch("duration"),
      hls_url:            d.fetch("hls_url"),
      is_gif:             d.fetch("is_gif"),
      transcoding_status: d.fetch("transcoding_status"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "fallback_url"       => @fallback_url,
      "height"             => @height,
      "width"              => @width,
      "scrubber_media_url" => @scrubber_media_url,
      "dash_url"           => @dash_url,
      "duration"           => @duration,
      "hls_url"            => @hls_url,
      "is_gif"             => @is_gif,
      "transcoding_status" => @transcoding_status,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Preview < Dry::Struct
  attribute :images,               Types.Array(Image)
  attribute :enabled,              Types::Bool
  attribute :reddit_video_preview, RedditVideoPreview.optional

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      images:               d.fetch("images").map { |x| Image.from_dynamic!(x) },
      enabled:              d.fetch("enabled"),
      reddit_video_preview: d["reddit_video_preview"] ? RedditVideoPreview.from_dynamic!(d["reddit_video_preview"]) : nil,
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "images"               => @images.map { |x| x.to_dynamic },
      "enabled"              => @enabled,
      "reddit_video_preview" => @reddit_video_preview&.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module SubredditType
  Public = "public"
end

class ChildData < Dry::Struct
  attribute :approved_at_utc,               Types::Nil
  attribute :subreddit,                     Types::String
  attribute :selftext,                      Types::String
  attribute :user_reports,                  Types.Array(Types::Any)
  attribute :saved,                         Types::Bool
  attribute :mod_reason_title,              Types::Nil
  attribute :gilded,                        Types::Int
  attribute :clicked,                       Types::Bool
  attribute :title,                         Types::String
  attribute :link_flair_richtext,           Types.Array(LinkFlairRichtext)
  attribute :subreddit_name_prefixed,       Types::String
  attribute :hidden,                        Types::Bool
  attribute :pwls,                          Types::Int
  attribute :link_flair_css_class,          Types::String.optional
  attribute :downs,                         Types::Int
  attribute :thumbnail_height,              Types::Int.optional
  attribute :parent_whitelist_status,       Types::WhitelistStatus
  attribute :hide_score,                    Types::Bool
  attribute :data_name,                     Types::String
  attribute :quarantine,                    Types::Bool
  attribute :link_flair_text_color,         Types::LinkFlairTextColor
  attribute :author_flair_background_color, Types::String.optional
  attribute :subreddit_type,                Types::SubredditType
  attribute :ups,                           Types::Int
  attribute :domain,                        Types::String
  attribute :media_embed,                   MediaEmbed
  attribute :thumbnail_width,               Types::Int.optional
  attribute :author_flair_template_id,      Types::Nil
  attribute :is_original_content,           Types::Bool
  attribute :secure_media,                  Types::Nil
  attribute :is_reddit_media_domain,        Types::Bool
  attribute :is_meta,                       Types::Bool
  attribute :category,                      Types::Nil
  attribute :secure_media_embed,            MediaEmbed
  attribute :link_flair_text,               Types::String.optional
  attribute :can_mod_post,                  Types::Bool
  attribute :score,                         Types::Int
  attribute :approved_by,                   Types::Nil
  attribute :thumbnail,                     Types::String
  attribute :edited,                        Types.Instance(Edited)
  attribute :author_flair_css_class,        Types::String.optional
  attribute :author_flair_richtext,         Types.Array(AuthorFlairRichtext)
  attribute :post_hint,                     Types::PostHint.optional
  attribute :content_categories,            Types.Array(Types::String).optional
  attribute :is_self,                       Types::Bool
  attribute :mod_note,                      Types::Nil
  attribute :created,                       Types::Double
  attribute :link_flair_type,               Types::FlairType
  attribute :wls,                           Types::Int
  attribute :banned_by,                     Types::Nil
  attribute :author_flair_type,             Types::FlairType
  attribute :contest_mode,                  Types::Bool
  attribute :selftext_html,                 Types::String.optional
  attribute :likes,                         Types::Nil
  attribute :suggested_sort,                Types::String.optional
  attribute :banned_at_utc,                 Types::Nil
  attribute :view_count,                    Types::Nil
  attribute :archived,                      Types::Bool
  attribute :no_follow,                     Types::Bool
  attribute :is_crosspostable,              Types::Bool
  attribute :pinned,                        Types::Bool
  attribute :over_18,                       Types::Bool
  attribute :preview,                       Preview.optional
  attribute :media_only,                    Types::Bool
  attribute :link_flair_template_id,        Types::String.optional
  attribute :can_gild,                      Types::Bool
  attribute :spoiler,                       Types::Bool
  attribute :locked,                        Types::Bool
  attribute :author_flair_text,             Types::String.optional
  attribute :visited,                       Types::Bool
  attribute :num_reports,                   Types::Nil
  attribute :distinguished,                 Types::Nil
  attribute :subreddit_id,                  Types::String
  attribute :mod_reason_by,                 Types::Nil
  attribute :removal_reason,                Types::Nil
  attribute :link_flair_background_color,   Types::LinkFlairBackgroundColor
  attribute :id,                            Types::String
  attribute :report_reasons,                Types::Nil
  attribute :author,                        Types::String
  attribute :num_crossposts,                Types::Int
  attribute :num_comments,                  Types::Int
  attribute :send_replies,                  Types::Bool
  attribute :mod_reports,                   Types.Array(Types::Any)
  attribute :author_flair_text_color,       Types::String.optional
  attribute :permalink,                     Types::String
  attribute :whitelist_status,              Types::WhitelistStatus
  attribute :stickied,                      Types::Bool
  attribute :url,                           Types::String
  attribute :subreddit_subscribers,         Types::Int
  attribute :created_utc,                   Types::Double
  attribute :media,                         Types::Nil
  attribute :is_video,                      Types::Bool

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      approved_at_utc:               d.fetch("approved_at_utc"),
      subreddit:                     d.fetch("subreddit"),
      selftext:                      d.fetch("selftext"),
      user_reports:                  d.fetch("user_reports"),
      saved:                         d.fetch("saved"),
      mod_reason_title:              d.fetch("mod_reason_title"),
      gilded:                        d.fetch("gilded"),
      clicked:                       d.fetch("clicked"),
      title:                         d.fetch("title"),
      link_flair_richtext:           d.fetch("link_flair_richtext").map { |x| LinkFlairRichtext.from_dynamic!(x) },
      subreddit_name_prefixed:       d.fetch("subreddit_name_prefixed"),
      hidden:                        d.fetch("hidden"),
      pwls:                          d.fetch("pwls"),
      link_flair_css_class:          d.fetch("link_flair_css_class"),
      downs:                         d.fetch("downs"),
      thumbnail_height:              d.fetch("thumbnail_height"),
      parent_whitelist_status:       d.fetch("parent_whitelist_status"),
      hide_score:                    d.fetch("hide_score"),
      data_name:                     d.fetch("name"),
      quarantine:                    d.fetch("quarantine"),
      link_flair_text_color:         d.fetch("link_flair_text_color"),
      author_flair_background_color: d.fetch("author_flair_background_color"),
      subreddit_type:                d.fetch("subreddit_type"),
      ups:                           d.fetch("ups"),
      domain:                        d.fetch("domain"),
      media_embed:                   MediaEmbed.from_dynamic!(d.fetch("media_embed")),
      thumbnail_width:               d.fetch("thumbnail_width"),
      author_flair_template_id:      d.fetch("author_flair_template_id"),
      is_original_content:           d.fetch("is_original_content"),
      secure_media:                  d.fetch("secure_media"),
      is_reddit_media_domain:        d.fetch("is_reddit_media_domain"),
      is_meta:                       d.fetch("is_meta"),
      category:                      d.fetch("category"),
      secure_media_embed:            MediaEmbed.from_dynamic!(d.fetch("secure_media_embed")),
      link_flair_text:               d.fetch("link_flair_text"),
      can_mod_post:                  d.fetch("can_mod_post"),
      score:                         d.fetch("score"),
      approved_by:                   d.fetch("approved_by"),
      thumbnail:                     d.fetch("thumbnail"),
      edited:                        Edited.from_dynamic!(d.fetch("edited")),
      author_flair_css_class:        d.fetch("author_flair_css_class"),
      author_flair_richtext:         d.fetch("author_flair_richtext").map { |x| AuthorFlairRichtext.from_dynamic!(x) },
      post_hint:                     d["post_hint"],
      content_categories:            d.fetch("content_categories"),
      is_self:                       d.fetch("is_self"),
      mod_note:                      d.fetch("mod_note"),
      created:                       d.fetch("created"),
      link_flair_type:               d.fetch("link_flair_type"),
      wls:                           d.fetch("wls"),
      banned_by:                     d.fetch("banned_by"),
      author_flair_type:             d.fetch("author_flair_type"),
      contest_mode:                  d.fetch("contest_mode"),
      selftext_html:                 d.fetch("selftext_html"),
      likes:                         d.fetch("likes"),
      suggested_sort:                d.fetch("suggested_sort"),
      banned_at_utc:                 d.fetch("banned_at_utc"),
      view_count:                    d.fetch("view_count"),
      archived:                      d.fetch("archived"),
      no_follow:                     d.fetch("no_follow"),
      is_crosspostable:              d.fetch("is_crosspostable"),
      pinned:                        d.fetch("pinned"),
      over_18:                       d.fetch("over_18"),
      preview:                       d["preview"] ? Preview.from_dynamic!(d["preview"]) : nil,
      media_only:                    d.fetch("media_only"),
      link_flair_template_id:        d.fetch("link_flair_template_id"),
      can_gild:                      d.fetch("can_gild"),
      spoiler:                       d.fetch("spoiler"),
      locked:                        d.fetch("locked"),
      author_flair_text:             d.fetch("author_flair_text"),
      visited:                       d.fetch("visited"),
      num_reports:                   d.fetch("num_reports"),
      distinguished:                 d.fetch("distinguished"),
      subreddit_id:                  d.fetch("subreddit_id"),
      mod_reason_by:                 d.fetch("mod_reason_by"),
      removal_reason:                d.fetch("removal_reason"),
      link_flair_background_color:   d.fetch("link_flair_background_color"),
      id:                            d.fetch("id"),
      report_reasons:                d.fetch("report_reasons"),
      author:                        d.fetch("author"),
      num_crossposts:                d.fetch("num_crossposts"),
      num_comments:                  d.fetch("num_comments"),
      send_replies:                  d.fetch("send_replies"),
      mod_reports:                   d.fetch("mod_reports"),
      author_flair_text_color:       d.fetch("author_flair_text_color"),
      permalink:                     d.fetch("permalink"),
      whitelist_status:              d.fetch("whitelist_status"),
      stickied:                      d.fetch("stickied"),
      url:                           d.fetch("url"),
      subreddit_subscribers:         d.fetch("subreddit_subscribers"),
      created_utc:                   d.fetch("created_utc"),
      media:                         d.fetch("media"),
      is_video:                      d.fetch("is_video"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "approved_at_utc"               => @approved_at_utc,
      "subreddit"                     => @subreddit,
      "selftext"                      => @selftext,
      "user_reports"                  => @user_reports,
      "saved"                         => @saved,
      "mod_reason_title"              => @mod_reason_title,
      "gilded"                        => @gilded,
      "clicked"                       => @clicked,
      "title"                         => @title,
      "link_flair_richtext"           => @link_flair_richtext.map { |x| x.to_dynamic },
      "subreddit_name_prefixed"       => @subreddit_name_prefixed,
      "hidden"                        => @hidden,
      "pwls"                          => @pwls,
      "link_flair_css_class"          => @link_flair_css_class,
      "downs"                         => @downs,
      "thumbnail_height"              => @thumbnail_height,
      "parent_whitelist_status"       => @parent_whitelist_status,
      "hide_score"                    => @hide_score,
      "name"                          => @data_name,
      "quarantine"                    => @quarantine,
      "link_flair_text_color"         => @link_flair_text_color,
      "author_flair_background_color" => @author_flair_background_color,
      "subreddit_type"                => @subreddit_type,
      "ups"                           => @ups,
      "domain"                        => @domain,
      "media_embed"                   => @media_embed.to_dynamic,
      "thumbnail_width"               => @thumbnail_width,
      "author_flair_template_id"      => @author_flair_template_id,
      "is_original_content"           => @is_original_content,
      "secure_media"                  => @secure_media,
      "is_reddit_media_domain"        => @is_reddit_media_domain,
      "is_meta"                       => @is_meta,
      "category"                      => @category,
      "secure_media_embed"            => @secure_media_embed.to_dynamic,
      "link_flair_text"               => @link_flair_text,
      "can_mod_post"                  => @can_mod_post,
      "score"                         => @score,
      "approved_by"                   => @approved_by,
      "thumbnail"                     => @thumbnail,
      "edited"                        => @edited.to_dynamic,
      "author_flair_css_class"        => @author_flair_css_class,
      "author_flair_richtext"         => @author_flair_richtext.map { |x| x.to_dynamic },
      "post_hint"                     => @post_hint,
      "content_categories"            => @content_categories,
      "is_self"                       => @is_self,
      "mod_note"                      => @mod_note,
      "created"                       => @created,
      "link_flair_type"               => @link_flair_type,
      "wls"                           => @wls,
      "banned_by"                     => @banned_by,
      "author_flair_type"             => @author_flair_type,
      "contest_mode"                  => @contest_mode,
      "selftext_html"                 => @selftext_html,
      "likes"                         => @likes,
      "suggested_sort"                => @suggested_sort,
      "banned_at_utc"                 => @banned_at_utc,
      "view_count"                    => @view_count,
      "archived"                      => @archived,
      "no_follow"                     => @no_follow,
      "is_crosspostable"              => @is_crosspostable,
      "pinned"                        => @pinned,
      "over_18"                       => @over_18,
      "preview"                       => @preview&.to_dynamic,
      "media_only"                    => @media_only,
      "link_flair_template_id"        => @link_flair_template_id,
      "can_gild"                      => @can_gild,
      "spoiler"                       => @spoiler,
      "locked"                        => @locked,
      "author_flair_text"             => @author_flair_text,
      "visited"                       => @visited,
      "num_reports"                   => @num_reports,
      "distinguished"                 => @distinguished,
      "subreddit_id"                  => @subreddit_id,
      "mod_reason_by"                 => @mod_reason_by,
      "removal_reason"                => @removal_reason,
      "link_flair_background_color"   => @link_flair_background_color,
      "id"                            => @id,
      "report_reasons"                => @report_reasons,
      "author"                        => @author,
      "num_crossposts"                => @num_crossposts,
      "num_comments"                  => @num_comments,
      "send_replies"                  => @send_replies,
      "mod_reports"                   => @mod_reports,
      "author_flair_text_color"       => @author_flair_text_color,
      "permalink"                     => @permalink,
      "whitelist_status"              => @whitelist_status,
      "stickied"                      => @stickied,
      "url"                           => @url,
      "subreddit_subscribers"         => @subreddit_subscribers,
      "created_utc"                   => @created_utc,
      "media"                         => @media,
      "is_video"                      => @is_video,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

module Kind
  T3 = "t3"
end

class Child < Dry::Struct
  attribute :kind, Types::Kind
  attribute :data, ChildData

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      kind: d.fetch("kind"),
      data: ChildData.from_dynamic!(d.fetch("data")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "kind" => @kind,
      "data" => @data.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class RedditData < Dry::Struct
  attribute :modhash,  Types::String
  attribute :dist,     Types::Int
  attribute :children, Types.Array(Child)
  attribute :after,    Types::String
  attribute :before,   Types::Nil

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      modhash:  d.fetch("modhash"),
      dist:     d.fetch("dist"),
      children: d.fetch("children").map { |x| Child.from_dynamic!(x) },
      after:    d.fetch("after"),
      before:   d.fetch("before"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "modhash"  => @modhash,
      "dist"     => @dist,
      "children" => @children.map { |x| x.to_dynamic },
      "after"    => @after,
      "before"   => @before,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Reddit < Dry::Struct
  attribute :kind, Types::String
  attribute :data, RedditData

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      kind: d.fetch("kind"),
      data: RedditData.from_dynamic!(d.fetch("data")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "kind" => @kind,
      "data" => @data.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
