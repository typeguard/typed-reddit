// To parse this JSON data, do
//
//     final reddit = redditFromJson(jsonString);

import 'dart:convert';

Reddit redditFromJson(String str) {
    final jsonData = json.decode(str);
    return Reddit.fromJson(jsonData);
}

String redditToJson(Reddit data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Reddit {
    String kind;
    RedditData data;

    Reddit({
        this.kind,
        this.data,
    });

    factory Reddit.fromJson(Map<String, dynamic> json) => new Reddit(
        kind: json["kind"],
        data: RedditData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "data": data.toJson(),
    };
}

class RedditData {
    String modhash;
    int dist;
    List<Child> children;
    String after;
    dynamic before;

    RedditData({
        this.modhash,
        this.dist,
        this.children,
        this.after,
        this.before,
    });

    factory RedditData.fromJson(Map<String, dynamic> json) => new RedditData(
        modhash: json["modhash"],
        dist: json["dist"],
        children: new List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
        after: json["after"],
        before: json["before"],
    );

    Map<String, dynamic> toJson() => {
        "modhash": modhash,
        "dist": dist,
        "children": new List<dynamic>.from(children.map((x) => x.toJson())),
        "after": after,
        "before": before,
    };
}

class Child {
    Kind kind;
    ChildData data;

    Child({
        this.kind,
        this.data,
    });

    factory Child.fromJson(Map<String, dynamic> json) => new Child(
        kind: kindValues.map[json["kind"]],
        data: ChildData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "kind": kindValues.reverse[kind],
        "data": data.toJson(),
    };
}

class ChildData {
    dynamic approvedAtUtc;
    String subreddit;
    String selftext;
    List<dynamic> userReports;
    bool saved;
    dynamic modReasonTitle;
    int gilded;
    bool clicked;
    String title;
    List<LinkFlairRichtext> linkFlairRichtext;
    String subredditNamePrefixed;
    bool hidden;
    int pwls;
    String linkFlairCssClass;
    int downs;
    int thumbnailHeight;
    WhitelistStatus parentWhitelistStatus;
    bool hideScore;
    String name;
    bool quarantine;
    LinkFlairTextColor linkFlairTextColor;
    String authorFlairBackgroundColor;
    SubredditType subredditType;
    int ups;
    String domain;
    MediaEmbed mediaEmbed;
    int thumbnailWidth;
    dynamic authorFlairTemplateId;
    bool isOriginalContent;
    dynamic secureMedia;
    bool isRedditMediaDomain;
    bool isMeta;
    dynamic category;
    MediaEmbed secureMediaEmbed;
    String linkFlairText;
    bool canModPost;
    int score;
    dynamic approvedBy;
    String thumbnail;
    dynamic edited;
    String authorFlairCssClass;
    List<AuthorFlairRichtext> authorFlairRichtext;
    PostHint postHint;
    List<String> contentCategories;
    bool isSelf;
    dynamic modNote;
    double created;
    FlairType linkFlairType;
    int wls;
    dynamic bannedBy;
    FlairType authorFlairType;
    bool contestMode;
    String selftextHtml;
    dynamic likes;
    String suggestedSort;
    dynamic bannedAtUtc;
    dynamic viewCount;
    bool archived;
    bool noFollow;
    bool isCrosspostable;
    bool pinned;
    bool over18;
    Preview preview;
    bool mediaOnly;
    String linkFlairTemplateId;
    bool canGild;
    bool spoiler;
    bool locked;
    String authorFlairText;
    bool visited;
    dynamic numReports;
    dynamic distinguished;
    String subredditId;
    dynamic modReasonBy;
    dynamic removalReason;
    LinkFlairBackgroundColor linkFlairBackgroundColor;
    String id;
    dynamic reportReasons;
    String author;
    int numCrossposts;
    int numComments;
    bool sendReplies;
    List<dynamic> modReports;
    String authorFlairTextColor;
    String permalink;
    WhitelistStatus whitelistStatus;
    bool stickied;
    String url;
    int subredditSubscribers;
    double createdUtc;
    dynamic media;
    bool isVideo;

    ChildData({
        this.approvedAtUtc,
        this.subreddit,
        this.selftext,
        this.userReports,
        this.saved,
        this.modReasonTitle,
        this.gilded,
        this.clicked,
        this.title,
        this.linkFlairRichtext,
        this.subredditNamePrefixed,
        this.hidden,
        this.pwls,
        this.linkFlairCssClass,
        this.downs,
        this.thumbnailHeight,
        this.parentWhitelistStatus,
        this.hideScore,
        this.name,
        this.quarantine,
        this.linkFlairTextColor,
        this.authorFlairBackgroundColor,
        this.subredditType,
        this.ups,
        this.domain,
        this.mediaEmbed,
        this.thumbnailWidth,
        this.authorFlairTemplateId,
        this.isOriginalContent,
        this.secureMedia,
        this.isRedditMediaDomain,
        this.isMeta,
        this.category,
        this.secureMediaEmbed,
        this.linkFlairText,
        this.canModPost,
        this.score,
        this.approvedBy,
        this.thumbnail,
        this.edited,
        this.authorFlairCssClass,
        this.authorFlairRichtext,
        this.postHint,
        this.contentCategories,
        this.isSelf,
        this.modNote,
        this.created,
        this.linkFlairType,
        this.wls,
        this.bannedBy,
        this.authorFlairType,
        this.contestMode,
        this.selftextHtml,
        this.likes,
        this.suggestedSort,
        this.bannedAtUtc,
        this.viewCount,
        this.archived,
        this.noFollow,
        this.isCrosspostable,
        this.pinned,
        this.over18,
        this.preview,
        this.mediaOnly,
        this.linkFlairTemplateId,
        this.canGild,
        this.spoiler,
        this.locked,
        this.authorFlairText,
        this.visited,
        this.numReports,
        this.distinguished,
        this.subredditId,
        this.modReasonBy,
        this.removalReason,
        this.linkFlairBackgroundColor,
        this.id,
        this.reportReasons,
        this.author,
        this.numCrossposts,
        this.numComments,
        this.sendReplies,
        this.modReports,
        this.authorFlairTextColor,
        this.permalink,
        this.whitelistStatus,
        this.stickied,
        this.url,
        this.subredditSubscribers,
        this.createdUtc,
        this.media,
        this.isVideo,
    });

    factory ChildData.fromJson(Map<String, dynamic> json) => new ChildData(
        approvedAtUtc: json["approved_at_utc"],
        subreddit: json["subreddit"],
        selftext: json["selftext"],
        userReports: new List<dynamic>.from(json["user_reports"].map((x) => x)),
        saved: json["saved"],
        modReasonTitle: json["mod_reason_title"],
        gilded: json["gilded"],
        clicked: json["clicked"],
        title: json["title"],
        linkFlairRichtext: new List<LinkFlairRichtext>.from(json["link_flair_richtext"].map((x) => LinkFlairRichtext.fromJson(x))),
        subredditNamePrefixed: json["subreddit_name_prefixed"],
        hidden: json["hidden"],
        pwls: json["pwls"],
        linkFlairCssClass: json["link_flair_css_class"] == null ? null : json["link_flair_css_class"],
        downs: json["downs"],
        thumbnailHeight: json["thumbnail_height"] == null ? null : json["thumbnail_height"],
        parentWhitelistStatus: whitelistStatusValues.map[json["parent_whitelist_status"]],
        hideScore: json["hide_score"],
        name: json["name"],
        quarantine: json["quarantine"],
        linkFlairTextColor: linkFlairTextColorValues.map[json["link_flair_text_color"]],
        authorFlairBackgroundColor: json["author_flair_background_color"] == null ? null : json["author_flair_background_color"],
        subredditType: subredditTypeValues.map[json["subreddit_type"]],
        ups: json["ups"],
        domain: json["domain"],
        mediaEmbed: MediaEmbed.fromJson(json["media_embed"]),
        thumbnailWidth: json["thumbnail_width"] == null ? null : json["thumbnail_width"],
        authorFlairTemplateId: json["author_flair_template_id"],
        isOriginalContent: json["is_original_content"],
        secureMedia: json["secure_media"],
        isRedditMediaDomain: json["is_reddit_media_domain"],
        isMeta: json["is_meta"],
        category: json["category"],
        secureMediaEmbed: MediaEmbed.fromJson(json["secure_media_embed"]),
        linkFlairText: json["link_flair_text"] == null ? null : json["link_flair_text"],
        canModPost: json["can_mod_post"],
        score: json["score"],
        approvedBy: json["approved_by"],
        thumbnail: json["thumbnail"],
        edited: json["edited"],
        authorFlairCssClass: json["author_flair_css_class"] == null ? null : json["author_flair_css_class"],
        authorFlairRichtext: new List<AuthorFlairRichtext>.from(json["author_flair_richtext"].map((x) => AuthorFlairRichtext.fromJson(x))),
        postHint: json["post_hint"] == null ? null : postHintValues.map[json["post_hint"]],
        contentCategories: json["content_categories"] == null ? null : new List<String>.from(json["content_categories"].map((x) => x)),
        isSelf: json["is_self"],
        modNote: json["mod_note"],
        created: json["created"].toDouble(),
        linkFlairType: flairTypeValues.map[json["link_flair_type"]],
        wls: json["wls"],
        bannedBy: json["banned_by"],
        authorFlairType: flairTypeValues.map[json["author_flair_type"]],
        contestMode: json["contest_mode"],
        selftextHtml: json["selftext_html"] == null ? null : json["selftext_html"],
        likes: json["likes"],
        suggestedSort: json["suggested_sort"] == null ? null : json["suggested_sort"],
        bannedAtUtc: json["banned_at_utc"],
        viewCount: json["view_count"],
        archived: json["archived"],
        noFollow: json["no_follow"],
        isCrosspostable: json["is_crosspostable"],
        pinned: json["pinned"],
        over18: json["over_18"],
        preview: json["preview"] == null ? null : Preview.fromJson(json["preview"]),
        mediaOnly: json["media_only"],
        linkFlairTemplateId: json["link_flair_template_id"] == null ? null : json["link_flair_template_id"],
        canGild: json["can_gild"],
        spoiler: json["spoiler"],
        locked: json["locked"],
        authorFlairText: json["author_flair_text"] == null ? null : json["author_flair_text"],
        visited: json["visited"],
        numReports: json["num_reports"],
        distinguished: json["distinguished"],
        subredditId: json["subreddit_id"],
        modReasonBy: json["mod_reason_by"],
        removalReason: json["removal_reason"],
        linkFlairBackgroundColor: linkFlairBackgroundColorValues.map[json["link_flair_background_color"]],
        id: json["id"],
        reportReasons: json["report_reasons"],
        author: json["author"],
        numCrossposts: json["num_crossposts"],
        numComments: json["num_comments"],
        sendReplies: json["send_replies"],
        modReports: new List<dynamic>.from(json["mod_reports"].map((x) => x)),
        authorFlairTextColor: json["author_flair_text_color"] == null ? null : json["author_flair_text_color"],
        permalink: json["permalink"],
        whitelistStatus: whitelistStatusValues.map[json["whitelist_status"]],
        stickied: json["stickied"],
        url: json["url"],
        subredditSubscribers: json["subreddit_subscribers"],
        createdUtc: json["created_utc"].toDouble(),
        media: json["media"],
        isVideo: json["is_video"],
    );

    Map<String, dynamic> toJson() => {
        "approved_at_utc": approvedAtUtc,
        "subreddit": subreddit,
        "selftext": selftext,
        "user_reports": new List<dynamic>.from(userReports.map((x) => x)),
        "saved": saved,
        "mod_reason_title": modReasonTitle,
        "gilded": gilded,
        "clicked": clicked,
        "title": title,
        "link_flair_richtext": new List<dynamic>.from(linkFlairRichtext.map((x) => x.toJson())),
        "subreddit_name_prefixed": subredditNamePrefixed,
        "hidden": hidden,
        "pwls": pwls,
        "link_flair_css_class": linkFlairCssClass == null ? null : linkFlairCssClass,
        "downs": downs,
        "thumbnail_height": thumbnailHeight == null ? null : thumbnailHeight,
        "parent_whitelist_status": whitelistStatusValues.reverse[parentWhitelistStatus],
        "hide_score": hideScore,
        "name": name,
        "quarantine": quarantine,
        "link_flair_text_color": linkFlairTextColorValues.reverse[linkFlairTextColor],
        "author_flair_background_color": authorFlairBackgroundColor == null ? null : authorFlairBackgroundColor,
        "subreddit_type": subredditTypeValues.reverse[subredditType],
        "ups": ups,
        "domain": domain,
        "media_embed": mediaEmbed.toJson(),
        "thumbnail_width": thumbnailWidth == null ? null : thumbnailWidth,
        "author_flair_template_id": authorFlairTemplateId,
        "is_original_content": isOriginalContent,
        "secure_media": secureMedia,
        "is_reddit_media_domain": isRedditMediaDomain,
        "is_meta": isMeta,
        "category": category,
        "secure_media_embed": secureMediaEmbed.toJson(),
        "link_flair_text": linkFlairText == null ? null : linkFlairText,
        "can_mod_post": canModPost,
        "score": score,
        "approved_by": approvedBy,
        "thumbnail": thumbnail,
        "edited": edited,
        "author_flair_css_class": authorFlairCssClass == null ? null : authorFlairCssClass,
        "author_flair_richtext": new List<dynamic>.from(authorFlairRichtext.map((x) => x.toJson())),
        "post_hint": postHint == null ? null : postHintValues.reverse[postHint],
        "content_categories": contentCategories == null ? null : new List<dynamic>.from(contentCategories.map((x) => x)),
        "is_self": isSelf,
        "mod_note": modNote,
        "created": created,
        "link_flair_type": flairTypeValues.reverse[linkFlairType],
        "wls": wls,
        "banned_by": bannedBy,
        "author_flair_type": flairTypeValues.reverse[authorFlairType],
        "contest_mode": contestMode,
        "selftext_html": selftextHtml == null ? null : selftextHtml,
        "likes": likes,
        "suggested_sort": suggestedSort == null ? null : suggestedSort,
        "banned_at_utc": bannedAtUtc,
        "view_count": viewCount,
        "archived": archived,
        "no_follow": noFollow,
        "is_crosspostable": isCrosspostable,
        "pinned": pinned,
        "over_18": over18,
        "preview": preview == null ? null : preview.toJson(),
        "media_only": mediaOnly,
        "link_flair_template_id": linkFlairTemplateId == null ? null : linkFlairTemplateId,
        "can_gild": canGild,
        "spoiler": spoiler,
        "locked": locked,
        "author_flair_text": authorFlairText == null ? null : authorFlairText,
        "visited": visited,
        "num_reports": numReports,
        "distinguished": distinguished,
        "subreddit_id": subredditId,
        "mod_reason_by": modReasonBy,
        "removal_reason": removalReason,
        "link_flair_background_color": linkFlairBackgroundColorValues.reverse[linkFlairBackgroundColor],
        "id": id,
        "report_reasons": reportReasons,
        "author": author,
        "num_crossposts": numCrossposts,
        "num_comments": numComments,
        "send_replies": sendReplies,
        "mod_reports": new List<dynamic>.from(modReports.map((x) => x)),
        "author_flair_text_color": authorFlairTextColor == null ? null : authorFlairTextColor,
        "permalink": permalink,
        "whitelist_status": whitelistStatusValues.reverse[whitelistStatus],
        "stickied": stickied,
        "url": url,
        "subreddit_subscribers": subredditSubscribers,
        "created_utc": createdUtc,
        "media": media,
        "is_video": isVideo,
    };
}

class AuthorFlairRichtext {
    String e;
    String t;

    AuthorFlairRichtext({
        this.e,
        this.t,
    });

    factory AuthorFlairRichtext.fromJson(Map<String, dynamic> json) => new AuthorFlairRichtext(
        e: json["e"],
        t: json["t"],
    );

    Map<String, dynamic> toJson() => {
        "e": e,
        "t": t,
    };
}

enum FlairType { TEXT, RICHTEXT }

final flairTypeValues = new EnumValues({
    "richtext": FlairType.RICHTEXT,
    "text": FlairType.TEXT
});

enum LinkFlairBackgroundColor { EMPTY, THE_6289_D1, FF4500 }

final linkFlairBackgroundColorValues = new EnumValues({
    "": LinkFlairBackgroundColor.EMPTY,
    "#ff4500": LinkFlairBackgroundColor.FF4500,
    "#6289d1": LinkFlairBackgroundColor.THE_6289_D1
});

class LinkFlairRichtext {
    String e;
    String t;
    String a;
    String u;

    LinkFlairRichtext({
        this.e,
        this.t,
        this.a,
        this.u,
    });

    factory LinkFlairRichtext.fromJson(Map<String, dynamic> json) => new LinkFlairRichtext(
        e: json["e"],
        t: json["t"] == null ? null : json["t"],
        a: json["a"] == null ? null : json["a"],
        u: json["u"] == null ? null : json["u"],
    );

    Map<String, dynamic> toJson() => {
        "e": e,
        "t": t == null ? null : t,
        "a": a == null ? null : a,
        "u": u == null ? null : u,
    };
}

enum LinkFlairTextColor { DARK, LIGHT }

final linkFlairTextColorValues = new EnumValues({
    "dark": LinkFlairTextColor.DARK,
    "light": LinkFlairTextColor.LIGHT
});

class MediaEmbed {
    MediaEmbed();

    factory MediaEmbed.fromJson(Map<String, dynamic> json) => new MediaEmbed(
    );

    Map<String, dynamic> toJson() => {
    };
}

enum WhitelistStatus { ALL_ADS, PROMO_ALL, HOUSE_ONLY }

final whitelistStatusValues = new EnumValues({
    "all_ads": WhitelistStatus.ALL_ADS,
    "house_only": WhitelistStatus.HOUSE_ONLY,
    "promo_all": WhitelistStatus.PROMO_ALL
});

enum PostHint { SELF, LINK, IMAGE }

final postHintValues = new EnumValues({
    "image": PostHint.IMAGE,
    "link": PostHint.LINK,
    "self": PostHint.SELF
});

class Preview {
    List<Image> images;
    bool enabled;
    RedditVideoPreview redditVideoPreview;

    Preview({
        this.images,
        this.enabled,
        this.redditVideoPreview,
    });

    factory Preview.fromJson(Map<String, dynamic> json) => new Preview(
        images: new List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        enabled: json["enabled"],
        redditVideoPreview: json["reddit_video_preview"] == null ? null : RedditVideoPreview.fromJson(json["reddit_video_preview"]),
    );

    Map<String, dynamic> toJson() => {
        "images": new List<dynamic>.from(images.map((x) => x.toJson())),
        "enabled": enabled,
        "reddit_video_preview": redditVideoPreview == null ? null : redditVideoPreview.toJson(),
    };
}

class Image {
    Source source;
    List<Source> resolutions;
    Variants variants;
    String id;

    Image({
        this.source,
        this.resolutions,
        this.variants,
        this.id,
    });

    factory Image.fromJson(Map<String, dynamic> json) => new Image(
        source: Source.fromJson(json["source"]),
        resolutions: new List<Source>.from(json["resolutions"].map((x) => Source.fromJson(x))),
        variants: Variants.fromJson(json["variants"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "resolutions": new List<dynamic>.from(resolutions.map((x) => x.toJson())),
        "variants": variants.toJson(),
        "id": id,
    };
}

class Source {
    String url;
    int width;
    int height;

    Source({
        this.url,
        this.width,
        this.height,
    });

    factory Source.fromJson(Map<String, dynamic> json) => new Source(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}

class Variants {
    Gif gif;
    Gif mp4;

    Variants({
        this.gif,
        this.mp4,
    });

    factory Variants.fromJson(Map<String, dynamic> json) => new Variants(
        gif: json["gif"] == null ? null : Gif.fromJson(json["gif"]),
        mp4: json["mp4"] == null ? null : Gif.fromJson(json["mp4"]),
    );

    Map<String, dynamic> toJson() => {
        "gif": gif == null ? null : gif.toJson(),
        "mp4": mp4 == null ? null : mp4.toJson(),
    };
}

class Gif {
    Source source;
    List<Source> resolutions;

    Gif({
        this.source,
        this.resolutions,
    });

    factory Gif.fromJson(Map<String, dynamic> json) => new Gif(
        source: Source.fromJson(json["source"]),
        resolutions: new List<Source>.from(json["resolutions"].map((x) => Source.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "resolutions": new List<dynamic>.from(resolutions.map((x) => x.toJson())),
    };
}

class RedditVideoPreview {
    String fallbackUrl;
    int height;
    int width;
    String scrubberMediaUrl;
    String dashUrl;
    int duration;
    String hlsUrl;
    bool isGif;
    String transcodingStatus;

    RedditVideoPreview({
        this.fallbackUrl,
        this.height,
        this.width,
        this.scrubberMediaUrl,
        this.dashUrl,
        this.duration,
        this.hlsUrl,
        this.isGif,
        this.transcodingStatus,
    });

    factory RedditVideoPreview.fromJson(Map<String, dynamic> json) => new RedditVideoPreview(
        fallbackUrl: json["fallback_url"],
        height: json["height"],
        width: json["width"],
        scrubberMediaUrl: json["scrubber_media_url"],
        dashUrl: json["dash_url"],
        duration: json["duration"],
        hlsUrl: json["hls_url"],
        isGif: json["is_gif"],
        transcodingStatus: json["transcoding_status"],
    );

    Map<String, dynamic> toJson() => {
        "fallback_url": fallbackUrl,
        "height": height,
        "width": width,
        "scrubber_media_url": scrubberMediaUrl,
        "dash_url": dashUrl,
        "duration": duration,
        "hls_url": hlsUrl,
        "is_gif": isGif,
        "transcoding_status": transcodingStatus,
    };
}

enum SubredditType { PUBLIC }

final subredditTypeValues = new EnumValues({
    "public": SubredditType.PUBLIC
});

enum Kind { T3 }

final kindValues = new EnumValues({
    "t3": Kind.T3
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
