// Example code that deserializes and serializes the model.
// extern crate serde;
// #[macro_use]
// extern crate serde_derive;
// extern crate serde_json;
//
// use generated_module::[object Object];
//
// fn main() {
//     let json = r#"{"answer": 42}"#;
//     let model: [object Object] = serde_json::from_str(&json).unwrap();
// }

extern crate serde_json;

#[derive(Serialize, Deserialize)]
pub struct Reddit {
    #[serde(rename = "kind")]
    kind: String,

    #[serde(rename = "data")]
    data: RedditData,
}

#[derive(Serialize, Deserialize)]
pub struct RedditData {
    #[serde(rename = "modhash")]
    modhash: String,

    #[serde(rename = "dist")]
    dist: i64,

    #[serde(rename = "children")]
    children: Vec<Child>,

    #[serde(rename = "after")]
    after: String,

    #[serde(rename = "before")]
    before: Option<serde_json::Value>,
}

#[derive(Serialize, Deserialize)]
pub struct Child {
    #[serde(rename = "kind")]
    kind: Kind,

    #[serde(rename = "data")]
    data: ChildData,
}

#[derive(Serialize, Deserialize)]
pub struct ChildData {
    #[serde(rename = "approved_at_utc")]
    approved_at_utc: Option<serde_json::Value>,

    #[serde(rename = "subreddit")]
    subreddit: String,

    #[serde(rename = "selftext")]
    selftext: String,

    #[serde(rename = "user_reports")]
    user_reports: Vec<Option<serde_json::Value>>,

    #[serde(rename = "saved")]
    saved: bool,

    #[serde(rename = "mod_reason_title")]
    mod_reason_title: Option<serde_json::Value>,

    #[serde(rename = "gilded")]
    gilded: i64,

    #[serde(rename = "clicked")]
    clicked: bool,

    #[serde(rename = "title")]
    title: String,

    #[serde(rename = "link_flair_richtext")]
    link_flair_richtext: Vec<LinkFlairRichtext>,

    #[serde(rename = "subreddit_name_prefixed")]
    subreddit_name_prefixed: String,

    #[serde(rename = "hidden")]
    hidden: bool,

    #[serde(rename = "pwls")]
    pwls: i64,

    #[serde(rename = "link_flair_css_class")]
    link_flair_css_class: Option<String>,

    #[serde(rename = "downs")]
    downs: i64,

    #[serde(rename = "thumbnail_height")]
    thumbnail_height: Option<i64>,

    #[serde(rename = "parent_whitelist_status")]
    parent_whitelist_status: WhitelistStatus,

    #[serde(rename = "hide_score")]
    hide_score: bool,

    #[serde(rename = "name")]
    name: String,

    #[serde(rename = "quarantine")]
    quarantine: bool,

    #[serde(rename = "link_flair_text_color")]
    link_flair_text_color: LinkFlairTextColor,

    #[serde(rename = "author_flair_background_color")]
    author_flair_background_color: Option<String>,

    #[serde(rename = "subreddit_type")]
    subreddit_type: SubredditType,

    #[serde(rename = "ups")]
    ups: i64,

    #[serde(rename = "domain")]
    domain: String,

    #[serde(rename = "media_embed")]
    media_embed: MediaEmbed,

    #[serde(rename = "thumbnail_width")]
    thumbnail_width: Option<i64>,

    #[serde(rename = "author_flair_template_id")]
    author_flair_template_id: Option<serde_json::Value>,

    #[serde(rename = "is_original_content")]
    is_original_content: bool,

    #[serde(rename = "secure_media")]
    secure_media: Option<serde_json::Value>,

    #[serde(rename = "is_reddit_media_domain")]
    is_reddit_media_domain: bool,

    #[serde(rename = "is_meta")]
    is_meta: bool,

    #[serde(rename = "category")]
    category: Option<serde_json::Value>,

    #[serde(rename = "secure_media_embed")]
    secure_media_embed: MediaEmbed,

    #[serde(rename = "link_flair_text")]
    link_flair_text: Option<String>,

    #[serde(rename = "can_mod_post")]
    can_mod_post: bool,

    #[serde(rename = "score")]
    score: i64,

    #[serde(rename = "approved_by")]
    approved_by: Option<serde_json::Value>,

    #[serde(rename = "thumbnail")]
    thumbnail: String,

    #[serde(rename = "edited")]
    edited: Edited,

    #[serde(rename = "author_flair_css_class")]
    author_flair_css_class: Option<String>,

    #[serde(rename = "author_flair_richtext")]
    author_flair_richtext: Vec<AuthorFlairRichtext>,

    #[serde(rename = "post_hint")]
    post_hint: Option<PostHint>,

    #[serde(rename = "content_categories")]
    content_categories: Option<Vec<String>>,

    #[serde(rename = "is_self")]
    is_self: bool,

    #[serde(rename = "mod_note")]
    mod_note: Option<serde_json::Value>,

    #[serde(rename = "created")]
    created: f64,

    #[serde(rename = "link_flair_type")]
    link_flair_type: FlairType,

    #[serde(rename = "wls")]
    wls: i64,

    #[serde(rename = "banned_by")]
    banned_by: Option<serde_json::Value>,

    #[serde(rename = "author_flair_type")]
    author_flair_type: FlairType,

    #[serde(rename = "contest_mode")]
    contest_mode: bool,

    #[serde(rename = "selftext_html")]
    selftext_html: Option<String>,

    #[serde(rename = "likes")]
    likes: Option<serde_json::Value>,

    #[serde(rename = "suggested_sort")]
    suggested_sort: Option<String>,

    #[serde(rename = "banned_at_utc")]
    banned_at_utc: Option<serde_json::Value>,

    #[serde(rename = "view_count")]
    view_count: Option<serde_json::Value>,

    #[serde(rename = "archived")]
    archived: bool,

    #[serde(rename = "no_follow")]
    no_follow: bool,

    #[serde(rename = "is_crosspostable")]
    is_crosspostable: bool,

    #[serde(rename = "pinned")]
    pinned: bool,

    #[serde(rename = "over_18")]
    over_18: bool,

    #[serde(rename = "preview")]
    preview: Option<Preview>,

    #[serde(rename = "media_only")]
    media_only: bool,

    #[serde(rename = "link_flair_template_id")]
    link_flair_template_id: Option<String>,

    #[serde(rename = "can_gild")]
    can_gild: bool,

    #[serde(rename = "spoiler")]
    spoiler: bool,

    #[serde(rename = "locked")]
    locked: bool,

    #[serde(rename = "author_flair_text")]
    author_flair_text: Option<String>,

    #[serde(rename = "visited")]
    visited: bool,

    #[serde(rename = "num_reports")]
    num_reports: Option<serde_json::Value>,

    #[serde(rename = "distinguished")]
    distinguished: Option<serde_json::Value>,

    #[serde(rename = "subreddit_id")]
    subreddit_id: String,

    #[serde(rename = "mod_reason_by")]
    mod_reason_by: Option<serde_json::Value>,

    #[serde(rename = "removal_reason")]
    removal_reason: Option<serde_json::Value>,

    #[serde(rename = "link_flair_background_color")]
    link_flair_background_color: LinkFlairBackgroundColor,

    #[serde(rename = "id")]
    id: String,

    #[serde(rename = "report_reasons")]
    report_reasons: Option<serde_json::Value>,

    #[serde(rename = "author")]
    author: String,

    #[serde(rename = "num_crossposts")]
    num_crossposts: i64,

    #[serde(rename = "num_comments")]
    num_comments: i64,

    #[serde(rename = "send_replies")]
    send_replies: bool,

    #[serde(rename = "mod_reports")]
    mod_reports: Vec<Option<serde_json::Value>>,

    #[serde(rename = "author_flair_text_color")]
    author_flair_text_color: Option<String>,

    #[serde(rename = "permalink")]
    permalink: String,

    #[serde(rename = "whitelist_status")]
    whitelist_status: WhitelistStatus,

    #[serde(rename = "stickied")]
    stickied: bool,

    #[serde(rename = "url")]
    url: String,

    #[serde(rename = "subreddit_subscribers")]
    subreddit_subscribers: i64,

    #[serde(rename = "created_utc")]
    created_utc: f64,

    #[serde(rename = "media")]
    media: Option<serde_json::Value>,

    #[serde(rename = "is_video")]
    is_video: bool,
}

#[derive(Serialize, Deserialize)]
pub struct AuthorFlairRichtext {
    #[serde(rename = "e")]
    e: String,

    #[serde(rename = "t")]
    t: String,
}

#[derive(Serialize, Deserialize)]
pub struct LinkFlairRichtext {
    #[serde(rename = "e")]
    e: String,

    #[serde(rename = "t")]
    t: Option<String>,

    #[serde(rename = "a")]
    a: Option<String>,

    #[serde(rename = "u")]
    u: Option<String>,
}

#[derive(Serialize, Deserialize)]
pub struct MediaEmbed {
}

#[derive(Serialize, Deserialize)]
pub struct Preview {
    #[serde(rename = "images")]
    images: Vec<Image>,

    #[serde(rename = "enabled")]
    enabled: bool,

    #[serde(rename = "reddit_video_preview")]
    reddit_video_preview: Option<RedditVideoPreview>,
}

#[derive(Serialize, Deserialize)]
pub struct Image {
    #[serde(rename = "source")]
    source: Source,

    #[serde(rename = "resolutions")]
    resolutions: Vec<Source>,

    #[serde(rename = "variants")]
    variants: Variants,

    #[serde(rename = "id")]
    id: String,
}

#[derive(Serialize, Deserialize)]
pub struct Source {
    #[serde(rename = "url")]
    url: String,

    #[serde(rename = "width")]
    width: i64,

    #[serde(rename = "height")]
    height: i64,
}

#[derive(Serialize, Deserialize)]
pub struct Variants {
    #[serde(rename = "gif")]
    gif: Option<Gif>,

    #[serde(rename = "mp4")]
    mp4: Option<Gif>,
}

#[derive(Serialize, Deserialize)]
pub struct Gif {
    #[serde(rename = "source")]
    source: Source,

    #[serde(rename = "resolutions")]
    resolutions: Vec<Source>,
}

#[derive(Serialize, Deserialize)]
pub struct RedditVideoPreview {
    #[serde(rename = "fallback_url")]
    fallback_url: String,

    #[serde(rename = "height")]
    height: i64,

    #[serde(rename = "width")]
    width: i64,

    #[serde(rename = "scrubber_media_url")]
    scrubber_media_url: String,

    #[serde(rename = "dash_url")]
    dash_url: String,

    #[serde(rename = "duration")]
    duration: i64,

    #[serde(rename = "hls_url")]
    hls_url: String,

    #[serde(rename = "is_gif")]
    is_gif: bool,

    #[serde(rename = "transcoding_status")]
    transcoding_status: String,
}

#[derive(Serialize, Deserialize)]
#[serde(untagged)]
pub enum Edited {
    Bool(bool),

    Double(f64),
}

#[derive(Serialize, Deserialize)]
pub enum FlairType {
    #[serde(rename = "richtext")]
    Richtext,

    #[serde(rename = "text")]
    Text,
}

#[derive(Serialize, Deserialize)]
pub enum LinkFlairBackgroundColor {
    #[serde(rename = "")]
    Empty,

    #[serde(rename = "#ff4500")]
    Ff4500,

    #[serde(rename = "#6289d1")]
    The6289D1,
}

#[derive(Serialize, Deserialize)]
pub enum LinkFlairTextColor {
    #[serde(rename = "dark")]
    Dark,

    #[serde(rename = "light")]
    Light,
}

#[derive(Serialize, Deserialize)]
pub enum WhitelistStatus {
    #[serde(rename = "all_ads")]
    AllAds,

    #[serde(rename = "house_only")]
    HouseOnly,

    #[serde(rename = "promo_all")]
    PromoAll,
}

#[derive(Serialize, Deserialize)]
pub enum PostHint {
    #[serde(rename = "image")]
    Image,

    #[serde(rename = "link")]
    Link,

    #[serde(rename = "self")]
    PostHintSelf,
}

#[derive(Serialize, Deserialize)]
pub enum SubredditType {
    #[serde(rename = "public")]
    Public,
}

#[derive(Serialize, Deserialize)]
pub enum Kind {
    #[serde(rename = "t3")]
    T3,
}
