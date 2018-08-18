# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = reddit_from_dict(json.loads(json_string))

from typing import Any, Optional, List, Union, TypeVar, Callable, Type, cast
from enum import Enum
from uuid import UUID


T = TypeVar("T")
EnumT = TypeVar("EnumT", bound=Enum)


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def from_none(x: Any) -> Any:
    assert x is None
    return x


def from_union(fs, x):
    for f in fs:
        try:
            return f(x)
        except:
            pass
    assert False


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_list(f: Callable[[Any], T], x: Any) -> List[T]:
    assert isinstance(x, list)
    return [f(y) for y in x]


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


def from_bool(x: Any) -> bool:
    assert isinstance(x, bool)
    return x


def from_float(x: Any) -> float:
    assert isinstance(x, (float, int)) and not isinstance(x, bool)
    return float(x)


def to_enum(c: Type[EnumT], x: Any) -> EnumT:
    assert isinstance(x, c)
    return x.value


def to_float(x: Any) -> float:
    assert isinstance(x, float)
    return x


class AuthorFlairRichtext:
    e: str
    t: str

    def __init__(self, e: str, t: str) -> None:
        self.e = e
        self.t = t

    @staticmethod
    def from_dict(obj: Any) -> 'AuthorFlairRichtext':
        assert isinstance(obj, dict)
        e = from_str(obj.get("e"))
        t = from_str(obj.get("t"))
        return AuthorFlairRichtext(e, t)

    def to_dict(self) -> dict:
        result: dict = {}
        result["e"] = from_str(self.e)
        result["t"] = from_str(self.t)
        return result


class FlairType(Enum):
    RICHTEXT = "richtext"
    TEXT = "text"


class LinkFlairBackgroundColor(Enum):
    EMPTY = ""
    FF4500 = "#ff4500"
    THE_6289_D1 = "#6289d1"


class LinkFlairRichtext:
    e: str
    t: Optional[str]
    a: Optional[str]
    u: Optional[str]

    def __init__(self, e: str, t: Optional[str], a: Optional[str], u: Optional[str]) -> None:
        self.e = e
        self.t = t
        self.a = a
        self.u = u

    @staticmethod
    def from_dict(obj: Any) -> 'LinkFlairRichtext':
        assert isinstance(obj, dict)
        e = from_str(obj.get("e"))
        t = from_union([from_str, from_none], obj.get("t"))
        a = from_union([from_str, from_none], obj.get("a"))
        u = from_union([from_str, from_none], obj.get("u"))
        return LinkFlairRichtext(e, t, a, u)

    def to_dict(self) -> dict:
        result: dict = {}
        result["e"] = from_str(self.e)
        result["t"] = from_union([from_str, from_none], self.t)
        result["a"] = from_union([from_str, from_none], self.a)
        result["u"] = from_union([from_str, from_none], self.u)
        return result


class LinkFlairTextColor(Enum):
    DARK = "dark"
    LIGHT = "light"


class MediaEmbed:
    pass

    def __init__(self, ) -> None:
        pass

    @staticmethod
    def from_dict(obj: Any) -> 'MediaEmbed':
        assert isinstance(obj, dict)
        return MediaEmbed()

    def to_dict(self) -> dict:
        result: dict = {}
        return result


class WhitelistStatus(Enum):
    ALL_ADS = "all_ads"
    HOUSE_ONLY = "house_only"
    PROMO_ALL = "promo_all"


class PostHint(Enum):
    IMAGE = "image"
    LINK = "link"
    SELF = "self"


class Source:
    url: str
    width: int
    height: int

    def __init__(self, url: str, width: int, height: int) -> None:
        self.url = url
        self.width = width
        self.height = height

    @staticmethod
    def from_dict(obj: Any) -> 'Source':
        assert isinstance(obj, dict)
        url = from_str(obj.get("url"))
        width = from_int(obj.get("width"))
        height = from_int(obj.get("height"))
        return Source(url, width, height)

    def to_dict(self) -> dict:
        result: dict = {}
        result["url"] = from_str(self.url)
        result["width"] = from_int(self.width)
        result["height"] = from_int(self.height)
        return result


class GIF:
    source: Source
    resolutions: List[Source]

    def __init__(self, source: Source, resolutions: List[Source]) -> None:
        self.source = source
        self.resolutions = resolutions

    @staticmethod
    def from_dict(obj: Any) -> 'GIF':
        assert isinstance(obj, dict)
        source = Source.from_dict(obj.get("source"))
        resolutions = from_list(Source.from_dict, obj.get("resolutions"))
        return GIF(source, resolutions)

    def to_dict(self) -> dict:
        result: dict = {}
        result["source"] = to_class(Source, self.source)
        result["resolutions"] = from_list(lambda x: to_class(Source, x), self.resolutions)
        return result


class Variants:
    gif: Optional[GIF]
    mp4: Optional[GIF]

    def __init__(self, gif: Optional[GIF], mp4: Optional[GIF]) -> None:
        self.gif = gif
        self.mp4 = mp4

    @staticmethod
    def from_dict(obj: Any) -> 'Variants':
        assert isinstance(obj, dict)
        gif = from_union([GIF.from_dict, from_none], obj.get("gif"))
        mp4 = from_union([GIF.from_dict, from_none], obj.get("mp4"))
        return Variants(gif, mp4)

    def to_dict(self) -> dict:
        result: dict = {}
        result["gif"] = from_union([lambda x: to_class(GIF, x), from_none], self.gif)
        result["mp4"] = from_union([lambda x: to_class(GIF, x), from_none], self.mp4)
        return result


class Image:
    source: Source
    resolutions: List[Source]
    variants: Variants
    id: str

    def __init__(self, source: Source, resolutions: List[Source], variants: Variants, id: str) -> None:
        self.source = source
        self.resolutions = resolutions
        self.variants = variants
        self.id = id

    @staticmethod
    def from_dict(obj: Any) -> 'Image':
        assert isinstance(obj, dict)
        source = Source.from_dict(obj.get("source"))
        resolutions = from_list(Source.from_dict, obj.get("resolutions"))
        variants = Variants.from_dict(obj.get("variants"))
        id = from_str(obj.get("id"))
        return Image(source, resolutions, variants, id)

    def to_dict(self) -> dict:
        result: dict = {}
        result["source"] = to_class(Source, self.source)
        result["resolutions"] = from_list(lambda x: to_class(Source, x), self.resolutions)
        result["variants"] = to_class(Variants, self.variants)
        result["id"] = from_str(self.id)
        return result


class RedditVideoPreview:
    fallback_url: str
    height: int
    width: int
    scrubber_media_url: str
    dash_url: str
    duration: int
    hls_url: str
    is_gif: bool
    transcoding_status: str

    def __init__(self, fallback_url: str, height: int, width: int, scrubber_media_url: str, dash_url: str, duration: int, hls_url: str, is_gif: bool, transcoding_status: str) -> None:
        self.fallback_url = fallback_url
        self.height = height
        self.width = width
        self.scrubber_media_url = scrubber_media_url
        self.dash_url = dash_url
        self.duration = duration
        self.hls_url = hls_url
        self.is_gif = is_gif
        self.transcoding_status = transcoding_status

    @staticmethod
    def from_dict(obj: Any) -> 'RedditVideoPreview':
        assert isinstance(obj, dict)
        fallback_url = from_str(obj.get("fallback_url"))
        height = from_int(obj.get("height"))
        width = from_int(obj.get("width"))
        scrubber_media_url = from_str(obj.get("scrubber_media_url"))
        dash_url = from_str(obj.get("dash_url"))
        duration = from_int(obj.get("duration"))
        hls_url = from_str(obj.get("hls_url"))
        is_gif = from_bool(obj.get("is_gif"))
        transcoding_status = from_str(obj.get("transcoding_status"))
        return RedditVideoPreview(fallback_url, height, width, scrubber_media_url, dash_url, duration, hls_url, is_gif, transcoding_status)

    def to_dict(self) -> dict:
        result: dict = {}
        result["fallback_url"] = from_str(self.fallback_url)
        result["height"] = from_int(self.height)
        result["width"] = from_int(self.width)
        result["scrubber_media_url"] = from_str(self.scrubber_media_url)
        result["dash_url"] = from_str(self.dash_url)
        result["duration"] = from_int(self.duration)
        result["hls_url"] = from_str(self.hls_url)
        result["is_gif"] = from_bool(self.is_gif)
        result["transcoding_status"] = from_str(self.transcoding_status)
        return result


class Preview:
    images: List[Image]
    enabled: bool
    reddit_video_preview: Optional[RedditVideoPreview]

    def __init__(self, images: List[Image], enabled: bool, reddit_video_preview: Optional[RedditVideoPreview]) -> None:
        self.images = images
        self.enabled = enabled
        self.reddit_video_preview = reddit_video_preview

    @staticmethod
    def from_dict(obj: Any) -> 'Preview':
        assert isinstance(obj, dict)
        images = from_list(Image.from_dict, obj.get("images"))
        enabled = from_bool(obj.get("enabled"))
        reddit_video_preview = from_union([RedditVideoPreview.from_dict, from_none], obj.get("reddit_video_preview"))
        return Preview(images, enabled, reddit_video_preview)

    def to_dict(self) -> dict:
        result: dict = {}
        result["images"] = from_list(lambda x: to_class(Image, x), self.images)
        result["enabled"] = from_bool(self.enabled)
        result["reddit_video_preview"] = from_union([lambda x: to_class(RedditVideoPreview, x), from_none], self.reddit_video_preview)
        return result


class SubredditType(Enum):
    PUBLIC = "public"


class ChildData:
    approved_at_utc: None
    subreddit: str
    selftext: str
    user_reports: List[Any]
    saved: bool
    mod_reason_title: None
    gilded: int
    clicked: bool
    title: str
    link_flair_richtext: List[LinkFlairRichtext]
    subreddit_name_prefixed: str
    hidden: bool
    pwls: int
    link_flair_css_class: Optional[str]
    downs: int
    thumbnail_height: Optional[int]
    parent_whitelist_status: WhitelistStatus
    hide_score: bool
    name: str
    quarantine: bool
    link_flair_text_color: LinkFlairTextColor
    author_flair_background_color: Optional[str]
    subreddit_type: SubredditType
    ups: int
    domain: str
    media_embed: MediaEmbed
    thumbnail_width: Optional[int]
    author_flair_template_id: None
    is_original_content: bool
    secure_media: None
    is_reddit_media_domain: bool
    is_meta: bool
    category: None
    secure_media_embed: MediaEmbed
    link_flair_text: Optional[str]
    can_mod_post: bool
    score: int
    approved_by: None
    thumbnail: str
    edited: Union[bool, float]
    author_flair_css_class: Optional[str]
    author_flair_richtext: List[AuthorFlairRichtext]
    post_hint: Optional[PostHint]
    content_categories: Optional[List[str]]
    is_self: bool
    mod_note: None
    created: float
    link_flair_type: FlairType
    wls: int
    banned_by: None
    author_flair_type: FlairType
    contest_mode: bool
    selftext_html: Optional[str]
    likes: None
    suggested_sort: Optional[str]
    banned_at_utc: None
    view_count: None
    archived: bool
    no_follow: bool
    is_crosspostable: bool
    pinned: bool
    over_18: bool
    preview: Optional[Preview]
    media_only: bool
    link_flair_template_id: Optional[UUID]
    can_gild: bool
    spoiler: bool
    locked: bool
    author_flair_text: Optional[str]
    visited: bool
    num_reports: None
    distinguished: None
    subreddit_id: str
    mod_reason_by: None
    removal_reason: None
    link_flair_background_color: LinkFlairBackgroundColor
    id: str
    report_reasons: None
    author: str
    num_crossposts: int
    num_comments: int
    send_replies: bool
    mod_reports: List[Any]
    author_flair_text_color: Optional[str]
    permalink: str
    whitelist_status: WhitelistStatus
    stickied: bool
    url: str
    subreddit_subscribers: int
    created_utc: float
    media: None
    is_video: bool

    def __init__(self, approved_at_utc: None, subreddit: str, selftext: str, user_reports: List[Any], saved: bool, mod_reason_title: None, gilded: int, clicked: bool, title: str, link_flair_richtext: List[LinkFlairRichtext], subreddit_name_prefixed: str, hidden: bool, pwls: int, link_flair_css_class: Optional[str], downs: int, thumbnail_height: Optional[int], parent_whitelist_status: WhitelistStatus, hide_score: bool, name: str, quarantine: bool, link_flair_text_color: LinkFlairTextColor, author_flair_background_color: Optional[str], subreddit_type: SubredditType, ups: int, domain: str, media_embed: MediaEmbed, thumbnail_width: Optional[int], author_flair_template_id: None, is_original_content: bool, secure_media: None, is_reddit_media_domain: bool, is_meta: bool, category: None, secure_media_embed: MediaEmbed, link_flair_text: Optional[str], can_mod_post: bool, score: int, approved_by: None, thumbnail: str, edited: Union[bool, float], author_flair_css_class: Optional[str], author_flair_richtext: List[AuthorFlairRichtext], post_hint: Optional[PostHint], content_categories: Optional[List[str]], is_self: bool, mod_note: None, created: float, link_flair_type: FlairType, wls: int, banned_by: None, author_flair_type: FlairType, contest_mode: bool, selftext_html: Optional[str], likes: None, suggested_sort: Optional[str], banned_at_utc: None, view_count: None, archived: bool, no_follow: bool, is_crosspostable: bool, pinned: bool, over_18: bool, preview: Optional[Preview], media_only: bool, link_flair_template_id: Optional[UUID], can_gild: bool, spoiler: bool, locked: bool, author_flair_text: Optional[str], visited: bool, num_reports: None, distinguished: None, subreddit_id: str, mod_reason_by: None, removal_reason: None, link_flair_background_color: LinkFlairBackgroundColor, id: str, report_reasons: None, author: str, num_crossposts: int, num_comments: int, send_replies: bool, mod_reports: List[Any], author_flair_text_color: Optional[str], permalink: str, whitelist_status: WhitelistStatus, stickied: bool, url: str, subreddit_subscribers: int, created_utc: float, media: None, is_video: bool) -> None:
        self.approved_at_utc = approved_at_utc
        self.subreddit = subreddit
        self.selftext = selftext
        self.user_reports = user_reports
        self.saved = saved
        self.mod_reason_title = mod_reason_title
        self.gilded = gilded
        self.clicked = clicked
        self.title = title
        self.link_flair_richtext = link_flair_richtext
        self.subreddit_name_prefixed = subreddit_name_prefixed
        self.hidden = hidden
        self.pwls = pwls
        self.link_flair_css_class = link_flair_css_class
        self.downs = downs
        self.thumbnail_height = thumbnail_height
        self.parent_whitelist_status = parent_whitelist_status
        self.hide_score = hide_score
        self.name = name
        self.quarantine = quarantine
        self.link_flair_text_color = link_flair_text_color
        self.author_flair_background_color = author_flair_background_color
        self.subreddit_type = subreddit_type
        self.ups = ups
        self.domain = domain
        self.media_embed = media_embed
        self.thumbnail_width = thumbnail_width
        self.author_flair_template_id = author_flair_template_id
        self.is_original_content = is_original_content
        self.secure_media = secure_media
        self.is_reddit_media_domain = is_reddit_media_domain
        self.is_meta = is_meta
        self.category = category
        self.secure_media_embed = secure_media_embed
        self.link_flair_text = link_flair_text
        self.can_mod_post = can_mod_post
        self.score = score
        self.approved_by = approved_by
        self.thumbnail = thumbnail
        self.edited = edited
        self.author_flair_css_class = author_flair_css_class
        self.author_flair_richtext = author_flair_richtext
        self.post_hint = post_hint
        self.content_categories = content_categories
        self.is_self = is_self
        self.mod_note = mod_note
        self.created = created
        self.link_flair_type = link_flair_type
        self.wls = wls
        self.banned_by = banned_by
        self.author_flair_type = author_flair_type
        self.contest_mode = contest_mode
        self.selftext_html = selftext_html
        self.likes = likes
        self.suggested_sort = suggested_sort
        self.banned_at_utc = banned_at_utc
        self.view_count = view_count
        self.archived = archived
        self.no_follow = no_follow
        self.is_crosspostable = is_crosspostable
        self.pinned = pinned
        self.over_18 = over_18
        self.preview = preview
        self.media_only = media_only
        self.link_flair_template_id = link_flair_template_id
        self.can_gild = can_gild
        self.spoiler = spoiler
        self.locked = locked
        self.author_flair_text = author_flair_text
        self.visited = visited
        self.num_reports = num_reports
        self.distinguished = distinguished
        self.subreddit_id = subreddit_id
        self.mod_reason_by = mod_reason_by
        self.removal_reason = removal_reason
        self.link_flair_background_color = link_flair_background_color
        self.id = id
        self.report_reasons = report_reasons
        self.author = author
        self.num_crossposts = num_crossposts
        self.num_comments = num_comments
        self.send_replies = send_replies
        self.mod_reports = mod_reports
        self.author_flair_text_color = author_flair_text_color
        self.permalink = permalink
        self.whitelist_status = whitelist_status
        self.stickied = stickied
        self.url = url
        self.subreddit_subscribers = subreddit_subscribers
        self.created_utc = created_utc
        self.media = media
        self.is_video = is_video

    @staticmethod
    def from_dict(obj: Any) -> 'ChildData':
        assert isinstance(obj, dict)
        approved_at_utc = from_none(obj.get("approved_at_utc"))
        subreddit = from_str(obj.get("subreddit"))
        selftext = from_str(obj.get("selftext"))
        user_reports = from_list(lambda x: x, obj.get("user_reports"))
        saved = from_bool(obj.get("saved"))
        mod_reason_title = from_none(obj.get("mod_reason_title"))
        gilded = from_int(obj.get("gilded"))
        clicked = from_bool(obj.get("clicked"))
        title = from_str(obj.get("title"))
        link_flair_richtext = from_list(LinkFlairRichtext.from_dict, obj.get("link_flair_richtext"))
        subreddit_name_prefixed = from_str(obj.get("subreddit_name_prefixed"))
        hidden = from_bool(obj.get("hidden"))
        pwls = from_int(obj.get("pwls"))
        link_flair_css_class = from_union([from_none, from_str], obj.get("link_flair_css_class"))
        downs = from_int(obj.get("downs"))
        thumbnail_height = from_union([from_none, from_int], obj.get("thumbnail_height"))
        parent_whitelist_status = WhitelistStatus(obj.get("parent_whitelist_status"))
        hide_score = from_bool(obj.get("hide_score"))
        name = from_str(obj.get("name"))
        quarantine = from_bool(obj.get("quarantine"))
        link_flair_text_color = LinkFlairTextColor(obj.get("link_flair_text_color"))
        author_flair_background_color = from_union([from_none, from_str], obj.get("author_flair_background_color"))
        subreddit_type = SubredditType(obj.get("subreddit_type"))
        ups = from_int(obj.get("ups"))
        domain = from_str(obj.get("domain"))
        media_embed = MediaEmbed.from_dict(obj.get("media_embed"))
        thumbnail_width = from_union([from_none, from_int], obj.get("thumbnail_width"))
        author_flair_template_id = from_none(obj.get("author_flair_template_id"))
        is_original_content = from_bool(obj.get("is_original_content"))
        secure_media = from_none(obj.get("secure_media"))
        is_reddit_media_domain = from_bool(obj.get("is_reddit_media_domain"))
        is_meta = from_bool(obj.get("is_meta"))
        category = from_none(obj.get("category"))
        secure_media_embed = MediaEmbed.from_dict(obj.get("secure_media_embed"))
        link_flair_text = from_union([from_none, from_str], obj.get("link_flair_text"))
        can_mod_post = from_bool(obj.get("can_mod_post"))
        score = from_int(obj.get("score"))
        approved_by = from_none(obj.get("approved_by"))
        thumbnail = from_str(obj.get("thumbnail"))
        edited = from_union([from_float, from_bool], obj.get("edited"))
        author_flair_css_class = from_union([from_none, from_str], obj.get("author_flair_css_class"))
        author_flair_richtext = from_list(AuthorFlairRichtext.from_dict, obj.get("author_flair_richtext"))
        post_hint = from_union([PostHint, from_none], obj.get("post_hint"))
        content_categories = from_union([from_none, lambda x: from_list(from_str, x)], obj.get("content_categories"))
        is_self = from_bool(obj.get("is_self"))
        mod_note = from_none(obj.get("mod_note"))
        created = from_float(obj.get("created"))
        link_flair_type = FlairType(obj.get("link_flair_type"))
        wls = from_int(obj.get("wls"))
        banned_by = from_none(obj.get("banned_by"))
        author_flair_type = FlairType(obj.get("author_flair_type"))
        contest_mode = from_bool(obj.get("contest_mode"))
        selftext_html = from_union([from_none, from_str], obj.get("selftext_html"))
        likes = from_none(obj.get("likes"))
        suggested_sort = from_union([from_none, from_str], obj.get("suggested_sort"))
        banned_at_utc = from_none(obj.get("banned_at_utc"))
        view_count = from_none(obj.get("view_count"))
        archived = from_bool(obj.get("archived"))
        no_follow = from_bool(obj.get("no_follow"))
        is_crosspostable = from_bool(obj.get("is_crosspostable"))
        pinned = from_bool(obj.get("pinned"))
        over_18 = from_bool(obj.get("over_18"))
        preview = from_union([Preview.from_dict, from_none], obj.get("preview"))
        media_only = from_bool(obj.get("media_only"))
        link_flair_template_id = from_union([from_none, lambda x: UUID(x)], obj.get("link_flair_template_id"))
        can_gild = from_bool(obj.get("can_gild"))
        spoiler = from_bool(obj.get("spoiler"))
        locked = from_bool(obj.get("locked"))
        author_flair_text = from_union([from_none, from_str], obj.get("author_flair_text"))
        visited = from_bool(obj.get("visited"))
        num_reports = from_none(obj.get("num_reports"))
        distinguished = from_none(obj.get("distinguished"))
        subreddit_id = from_str(obj.get("subreddit_id"))
        mod_reason_by = from_none(obj.get("mod_reason_by"))
        removal_reason = from_none(obj.get("removal_reason"))
        link_flair_background_color = LinkFlairBackgroundColor(obj.get("link_flair_background_color"))
        id = from_str(obj.get("id"))
        report_reasons = from_none(obj.get("report_reasons"))
        author = from_str(obj.get("author"))
        num_crossposts = from_int(obj.get("num_crossposts"))
        num_comments = from_int(obj.get("num_comments"))
        send_replies = from_bool(obj.get("send_replies"))
        mod_reports = from_list(lambda x: x, obj.get("mod_reports"))
        author_flair_text_color = from_union([from_none, from_str], obj.get("author_flair_text_color"))
        permalink = from_str(obj.get("permalink"))
        whitelist_status = WhitelistStatus(obj.get("whitelist_status"))
        stickied = from_bool(obj.get("stickied"))
        url = from_str(obj.get("url"))
        subreddit_subscribers = from_int(obj.get("subreddit_subscribers"))
        created_utc = from_float(obj.get("created_utc"))
        media = from_none(obj.get("media"))
        is_video = from_bool(obj.get("is_video"))
        return ChildData(approved_at_utc, subreddit, selftext, user_reports, saved, mod_reason_title, gilded, clicked, title, link_flair_richtext, subreddit_name_prefixed, hidden, pwls, link_flair_css_class, downs, thumbnail_height, parent_whitelist_status, hide_score, name, quarantine, link_flair_text_color, author_flair_background_color, subreddit_type, ups, domain, media_embed, thumbnail_width, author_flair_template_id, is_original_content, secure_media, is_reddit_media_domain, is_meta, category, secure_media_embed, link_flair_text, can_mod_post, score, approved_by, thumbnail, edited, author_flair_css_class, author_flair_richtext, post_hint, content_categories, is_self, mod_note, created, link_flair_type, wls, banned_by, author_flair_type, contest_mode, selftext_html, likes, suggested_sort, banned_at_utc, view_count, archived, no_follow, is_crosspostable, pinned, over_18, preview, media_only, link_flair_template_id, can_gild, spoiler, locked, author_flair_text, visited, num_reports, distinguished, subreddit_id, mod_reason_by, removal_reason, link_flair_background_color, id, report_reasons, author, num_crossposts, num_comments, send_replies, mod_reports, author_flair_text_color, permalink, whitelist_status, stickied, url, subreddit_subscribers, created_utc, media, is_video)

    def to_dict(self) -> dict:
        result: dict = {}
        result["approved_at_utc"] = from_none(self.approved_at_utc)
        result["subreddit"] = from_str(self.subreddit)
        result["selftext"] = from_str(self.selftext)
        result["user_reports"] = from_list(lambda x: x, self.user_reports)
        result["saved"] = from_bool(self.saved)
        result["mod_reason_title"] = from_none(self.mod_reason_title)
        result["gilded"] = from_int(self.gilded)
        result["clicked"] = from_bool(self.clicked)
        result["title"] = from_str(self.title)
        result["link_flair_richtext"] = from_list(lambda x: to_class(LinkFlairRichtext, x), self.link_flair_richtext)
        result["subreddit_name_prefixed"] = from_str(self.subreddit_name_prefixed)
        result["hidden"] = from_bool(self.hidden)
        result["pwls"] = from_int(self.pwls)
        result["link_flair_css_class"] = from_union([from_none, from_str], self.link_flair_css_class)
        result["downs"] = from_int(self.downs)
        result["thumbnail_height"] = from_union([from_none, from_int], self.thumbnail_height)
        result["parent_whitelist_status"] = to_enum(WhitelistStatus, self.parent_whitelist_status)
        result["hide_score"] = from_bool(self.hide_score)
        result["name"] = from_str(self.name)
        result["quarantine"] = from_bool(self.quarantine)
        result["link_flair_text_color"] = to_enum(LinkFlairTextColor, self.link_flair_text_color)
        result["author_flair_background_color"] = from_union([from_none, from_str], self.author_flair_background_color)
        result["subreddit_type"] = to_enum(SubredditType, self.subreddit_type)
        result["ups"] = from_int(self.ups)
        result["domain"] = from_str(self.domain)
        result["media_embed"] = to_class(MediaEmbed, self.media_embed)
        result["thumbnail_width"] = from_union([from_none, from_int], self.thumbnail_width)
        result["author_flair_template_id"] = from_none(self.author_flair_template_id)
        result["is_original_content"] = from_bool(self.is_original_content)
        result["secure_media"] = from_none(self.secure_media)
        result["is_reddit_media_domain"] = from_bool(self.is_reddit_media_domain)
        result["is_meta"] = from_bool(self.is_meta)
        result["category"] = from_none(self.category)
        result["secure_media_embed"] = to_class(MediaEmbed, self.secure_media_embed)
        result["link_flair_text"] = from_union([from_none, from_str], self.link_flair_text)
        result["can_mod_post"] = from_bool(self.can_mod_post)
        result["score"] = from_int(self.score)
        result["approved_by"] = from_none(self.approved_by)
        result["thumbnail"] = from_str(self.thumbnail)
        result["edited"] = from_union([to_float, from_bool], self.edited)
        result["author_flair_css_class"] = from_union([from_none, from_str], self.author_flair_css_class)
        result["author_flair_richtext"] = from_list(lambda x: to_class(AuthorFlairRichtext, x), self.author_flair_richtext)
        result["post_hint"] = from_union([lambda x: to_enum(PostHint, x), from_none], self.post_hint)
        result["content_categories"] = from_union([from_none, lambda x: from_list(from_str, x)], self.content_categories)
        result["is_self"] = from_bool(self.is_self)
        result["mod_note"] = from_none(self.mod_note)
        result["created"] = to_float(self.created)
        result["link_flair_type"] = to_enum(FlairType, self.link_flair_type)
        result["wls"] = from_int(self.wls)
        result["banned_by"] = from_none(self.banned_by)
        result["author_flair_type"] = to_enum(FlairType, self.author_flair_type)
        result["contest_mode"] = from_bool(self.contest_mode)
        result["selftext_html"] = from_union([from_none, from_str], self.selftext_html)
        result["likes"] = from_none(self.likes)
        result["suggested_sort"] = from_union([from_none, from_str], self.suggested_sort)
        result["banned_at_utc"] = from_none(self.banned_at_utc)
        result["view_count"] = from_none(self.view_count)
        result["archived"] = from_bool(self.archived)
        result["no_follow"] = from_bool(self.no_follow)
        result["is_crosspostable"] = from_bool(self.is_crosspostable)
        result["pinned"] = from_bool(self.pinned)
        result["over_18"] = from_bool(self.over_18)
        result["preview"] = from_union([lambda x: to_class(Preview, x), from_none], self.preview)
        result["media_only"] = from_bool(self.media_only)
        result["link_flair_template_id"] = from_union([from_none, lambda x: str(x)], self.link_flair_template_id)
        result["can_gild"] = from_bool(self.can_gild)
        result["spoiler"] = from_bool(self.spoiler)
        result["locked"] = from_bool(self.locked)
        result["author_flair_text"] = from_union([from_none, from_str], self.author_flair_text)
        result["visited"] = from_bool(self.visited)
        result["num_reports"] = from_none(self.num_reports)
        result["distinguished"] = from_none(self.distinguished)
        result["subreddit_id"] = from_str(self.subreddit_id)
        result["mod_reason_by"] = from_none(self.mod_reason_by)
        result["removal_reason"] = from_none(self.removal_reason)
        result["link_flair_background_color"] = to_enum(LinkFlairBackgroundColor, self.link_flair_background_color)
        result["id"] = from_str(self.id)
        result["report_reasons"] = from_none(self.report_reasons)
        result["author"] = from_str(self.author)
        result["num_crossposts"] = from_int(self.num_crossposts)
        result["num_comments"] = from_int(self.num_comments)
        result["send_replies"] = from_bool(self.send_replies)
        result["mod_reports"] = from_list(lambda x: x, self.mod_reports)
        result["author_flair_text_color"] = from_union([from_none, from_str], self.author_flair_text_color)
        result["permalink"] = from_str(self.permalink)
        result["whitelist_status"] = to_enum(WhitelistStatus, self.whitelist_status)
        result["stickied"] = from_bool(self.stickied)
        result["url"] = from_str(self.url)
        result["subreddit_subscribers"] = from_int(self.subreddit_subscribers)
        result["created_utc"] = to_float(self.created_utc)
        result["media"] = from_none(self.media)
        result["is_video"] = from_bool(self.is_video)
        return result


class Kind(Enum):
    T3 = "t3"


class Child:
    kind: Kind
    data: ChildData

    def __init__(self, kind: Kind, data: ChildData) -> None:
        self.kind = kind
        self.data = data

    @staticmethod
    def from_dict(obj: Any) -> 'Child':
        assert isinstance(obj, dict)
        kind = Kind(obj.get("kind"))
        data = ChildData.from_dict(obj.get("data"))
        return Child(kind, data)

    def to_dict(self) -> dict:
        result: dict = {}
        result["kind"] = to_enum(Kind, self.kind)
        result["data"] = to_class(ChildData, self.data)
        return result


class RedditData:
    modhash: str
    dist: int
    children: List[Child]
    after: str
    before: None

    def __init__(self, modhash: str, dist: int, children: List[Child], after: str, before: None) -> None:
        self.modhash = modhash
        self.dist = dist
        self.children = children
        self.after = after
        self.before = before

    @staticmethod
    def from_dict(obj: Any) -> 'RedditData':
        assert isinstance(obj, dict)
        modhash = from_str(obj.get("modhash"))
        dist = from_int(obj.get("dist"))
        children = from_list(Child.from_dict, obj.get("children"))
        after = from_str(obj.get("after"))
        before = from_none(obj.get("before"))
        return RedditData(modhash, dist, children, after, before)

    def to_dict(self) -> dict:
        result: dict = {}
        result["modhash"] = from_str(self.modhash)
        result["dist"] = from_int(self.dist)
        result["children"] = from_list(lambda x: to_class(Child, x), self.children)
        result["after"] = from_str(self.after)
        result["before"] = from_none(self.before)
        return result


class Reddit:
    kind: str
    data: RedditData

    def __init__(self, kind: str, data: RedditData) -> None:
        self.kind = kind
        self.data = data

    @staticmethod
    def from_dict(obj: Any) -> 'Reddit':
        assert isinstance(obj, dict)
        kind = from_str(obj.get("kind"))
        data = RedditData.from_dict(obj.get("data"))
        return Reddit(kind, data)

    def to_dict(self) -> dict:
        result: dict = {}
        result["kind"] = from_str(self.kind)
        result["data"] = to_class(RedditData, self.data)
        return result


def reddit_from_dict(s: Any) -> Reddit:
    return Reddit.from_dict(s)


def reddit_to_dict(x: Reddit) -> Any:
    return to_class(Reddit, x)
