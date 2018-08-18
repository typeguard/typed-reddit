// To parse the JSON, add this file to your project and do:
//
//   let reddit = try Reddit(json)

import Foundation

struct Reddit: Codable {
    let kind: String
    let data: RedditData
}

struct RedditData: Codable {
    let modhash: String
    let dist: Int
    let children: [Child]
    let after: String
    let before: JSONNull?
}

struct Child: Codable {
    let kind: Kind
    let data: ChildData
}

struct ChildData: Codable {
    let approvedAtUTC: JSONNull?
    let subreddit, selftext: String
    let userReports: [JSONAny]
    let saved: Bool
    let modReasonTitle: JSONNull?
    let gilded: Int
    let clicked: Bool
    let title: String
    let linkFlairRichtext: [LinkFlairRichtext]
    let subredditNamePrefixed: String
    let hidden: Bool
    let pwls: Int
    let linkFlairCSSClass: String?
    let downs: Int
    let thumbnailHeight: Int?
    let parentWhitelistStatus: WhitelistStatus
    let hideScore: Bool
    let name: String
    let quarantine: Bool
    let linkFlairTextColor: LinkFlairTextColor
    let authorFlairBackgroundColor: String?
    let subredditType: SubredditType
    let ups: Int
    let domain: String
    let mediaEmbed: MediaEmbed
    let thumbnailWidth: Int?
    let authorFlairTemplateID: JSONNull?
    let isOriginalContent: Bool
    let secureMedia: JSONNull?
    let isRedditMediaDomain, isMeta: Bool
    let category: JSONNull?
    let secureMediaEmbed: MediaEmbed
    let linkFlairText: String?
    let canModPost: Bool
    let score: Int
    let approvedBy: JSONNull?
    let thumbnail: String
    let edited: Edited
    let authorFlairCSSClass: String?
    let authorFlairRichtext: [AuthorFlairRichtext]
    let postHint: PostHint?
    let contentCategories: [String]?
    let isSelf: Bool
    let modNote: JSONNull?
    let created: Double
    let linkFlairType: FlairType
    let wls: Int
    let bannedBy: JSONNull?
    let authorFlairType: FlairType
    let contestMode: Bool
    let selftextHTML: String?
    let likes: JSONNull?
    let suggestedSort: String?
    let bannedAtUTC, viewCount: JSONNull?
    let archived, noFollow, isCrosspostable, pinned: Bool
    let over18: Bool
    let preview: Preview?
    let mediaOnly: Bool
    let linkFlairTemplateID: String?
    let canGild, spoiler, locked: Bool
    let authorFlairText: String?
    let visited: Bool
    let numReports, distinguished: JSONNull?
    let subredditID: String
    let modReasonBy, removalReason: JSONNull?
    let linkFlairBackgroundColor: LinkFlairBackgroundColor
    let id: String
    let reportReasons: JSONNull?
    let author: String
    let numCrossposts, numComments: Int
    let sendReplies: Bool
    let modReports: [JSONAny]
    let authorFlairTextColor: String?
    let permalink: String
    let whitelistStatus: WhitelistStatus
    let stickied: Bool
    let url: String
    let subredditSubscribers: Int
    let createdUTC: Double
    let media: JSONNull?
    let isVideo: Bool

    enum CodingKeys: String, CodingKey {
        case approvedAtUTC = "approved_at_utc"
        case subreddit, selftext
        case userReports = "user_reports"
        case saved
        case modReasonTitle = "mod_reason_title"
        case gilded, clicked, title
        case linkFlairRichtext = "link_flair_richtext"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case hidden, pwls
        case linkFlairCSSClass = "link_flair_css_class"
        case downs
        case thumbnailHeight = "thumbnail_height"
        case parentWhitelistStatus = "parent_whitelist_status"
        case hideScore = "hide_score"
        case name, quarantine
        case linkFlairTextColor = "link_flair_text_color"
        case authorFlairBackgroundColor = "author_flair_background_color"
        case subredditType = "subreddit_type"
        case ups, domain
        case mediaEmbed = "media_embed"
        case thumbnailWidth = "thumbnail_width"
        case authorFlairTemplateID = "author_flair_template_id"
        case isOriginalContent = "is_original_content"
        case secureMedia = "secure_media"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isMeta = "is_meta"
        case category
        case secureMediaEmbed = "secure_media_embed"
        case linkFlairText = "link_flair_text"
        case canModPost = "can_mod_post"
        case score
        case approvedBy = "approved_by"
        case thumbnail, edited
        case authorFlairCSSClass = "author_flair_css_class"
        case authorFlairRichtext = "author_flair_richtext"
        case postHint = "post_hint"
        case contentCategories = "content_categories"
        case isSelf = "is_self"
        case modNote = "mod_note"
        case created
        case linkFlairType = "link_flair_type"
        case wls
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case contestMode = "contest_mode"
        case selftextHTML = "selftext_html"
        case likes
        case suggestedSort = "suggested_sort"
        case bannedAtUTC = "banned_at_utc"
        case viewCount = "view_count"
        case archived
        case noFollow = "no_follow"
        case isCrosspostable = "is_crosspostable"
        case pinned
        case over18 = "over_18"
        case preview
        case mediaOnly = "media_only"
        case linkFlairTemplateID = "link_flair_template_id"
        case canGild = "can_gild"
        case spoiler, locked
        case authorFlairText = "author_flair_text"
        case visited
        case numReports = "num_reports"
        case distinguished
        case subredditID = "subreddit_id"
        case modReasonBy = "mod_reason_by"
        case removalReason = "removal_reason"
        case linkFlairBackgroundColor = "link_flair_background_color"
        case id
        case reportReasons = "report_reasons"
        case author
        case numCrossposts = "num_crossposts"
        case numComments = "num_comments"
        case sendReplies = "send_replies"
        case modReports = "mod_reports"
        case authorFlairTextColor = "author_flair_text_color"
        case permalink
        case whitelistStatus = "whitelist_status"
        case stickied, url
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
        case media
        case isVideo = "is_video"
    }
}

struct AuthorFlairRichtext: Codable {
    let e, t: String
}

enum FlairType: String, Codable {
    case richtext = "richtext"
    case text = "text"
}

enum Edited: Codable {
    case bool(Bool)
    case double(Double)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        throw DecodingError.typeMismatch(Edited.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Edited"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .double(let x):
            try container.encode(x)
        }
    }
}

enum LinkFlairBackgroundColor: String, Codable {
    case empty = ""
    case ff4500 = "#ff4500"
    case the6289D1 = "#6289d1"
}

struct LinkFlairRichtext: Codable {
    let e: String
    let t, a, u: String?
}

enum LinkFlairTextColor: String, Codable {
    case dark = "dark"
    case light = "light"
}

struct MediaEmbed: Codable {
}

enum WhitelistStatus: String, Codable {
    case allAds = "all_ads"
    case houseOnly = "house_only"
    case promoAll = "promo_all"
}

enum PostHint: String, Codable {
    case image = "image"
    case link = "link"
    case postHintSelf = "self"
}

struct Preview: Codable {
    let images: [Image]
    let enabled: Bool
    let redditVideoPreview: RedditVideoPreview?

    enum CodingKeys: String, CodingKey {
        case images, enabled
        case redditVideoPreview = "reddit_video_preview"
    }
}

struct Image: Codable {
    let source: Source
    let resolutions: [Source]
    let variants: Variants
    let id: String
}

struct Source: Codable {
    let url: String
    let width, height: Int
}

struct Variants: Codable {
    let gif, mp4: GIF?
}

struct GIF: Codable {
    let source: Source
    let resolutions: [Source]
}

struct RedditVideoPreview: Codable {
    let fallbackURL: String
    let height, width: Int
    let scrubberMediaURL, dashURL: String
    let duration: Int
    let hlsURL: String
    let isGIF: Bool
    let transcodingStatus: String

    enum CodingKeys: String, CodingKey {
        case fallbackURL = "fallback_url"
        case height, width
        case scrubberMediaURL = "scrubber_media_url"
        case dashURL = "dash_url"
        case duration
        case hlsURL = "hls_url"
        case isGIF = "is_gif"
        case transcodingStatus = "transcoding_status"
    }
}

enum SubredditType: String, Codable {
    case subredditTypePublic = "public"
}

enum Kind: String, Codable {
    case t3 = "t3"
}

// MARK: Convenience initializers and mutators

extension Reddit {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Reddit.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        kind: String? = nil,
        data: RedditData? = nil
    ) -> Reddit {
        return Reddit(
            kind: kind ?? self.kind,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension RedditData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RedditData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        modhash: String? = nil,
        dist: Int? = nil,
        children: [Child]? = nil,
        after: String? = nil,
        before: JSONNull?? = nil
    ) -> RedditData {
        return RedditData(
            modhash: modhash ?? self.modhash,
            dist: dist ?? self.dist,
            children: children ?? self.children,
            after: after ?? self.after,
            before: before ?? self.before
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Child {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Child.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        kind: Kind? = nil,
        data: ChildData? = nil
    ) -> Child {
        return Child(
            kind: kind ?? self.kind,
            data: data ?? self.data
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension ChildData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ChildData.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        approvedAtUTC: JSONNull?? = nil,
        subreddit: String? = nil,
        selftext: String? = nil,
        userReports: [JSONAny]? = nil,
        saved: Bool? = nil,
        modReasonTitle: JSONNull?? = nil,
        gilded: Int? = nil,
        clicked: Bool? = nil,
        title: String? = nil,
        linkFlairRichtext: [LinkFlairRichtext]? = nil,
        subredditNamePrefixed: String? = nil,
        hidden: Bool? = nil,
        pwls: Int? = nil,
        linkFlairCSSClass: String?? = nil,
        downs: Int? = nil,
        thumbnailHeight: Int?? = nil,
        parentWhitelistStatus: WhitelistStatus? = nil,
        hideScore: Bool? = nil,
        name: String? = nil,
        quarantine: Bool? = nil,
        linkFlairTextColor: LinkFlairTextColor? = nil,
        authorFlairBackgroundColor: String?? = nil,
        subredditType: SubredditType? = nil,
        ups: Int? = nil,
        domain: String? = nil,
        mediaEmbed: MediaEmbed? = nil,
        thumbnailWidth: Int?? = nil,
        authorFlairTemplateID: JSONNull?? = nil,
        isOriginalContent: Bool? = nil,
        secureMedia: JSONNull?? = nil,
        isRedditMediaDomain: Bool? = nil,
        isMeta: Bool? = nil,
        category: JSONNull?? = nil,
        secureMediaEmbed: MediaEmbed? = nil,
        linkFlairText: String?? = nil,
        canModPost: Bool? = nil,
        score: Int? = nil,
        approvedBy: JSONNull?? = nil,
        thumbnail: String? = nil,
        edited: Edited? = nil,
        authorFlairCSSClass: String?? = nil,
        authorFlairRichtext: [AuthorFlairRichtext]? = nil,
        postHint: PostHint?? = nil,
        contentCategories: [String]?? = nil,
        isSelf: Bool? = nil,
        modNote: JSONNull?? = nil,
        created: Double? = nil,
        linkFlairType: FlairType? = nil,
        wls: Int? = nil,
        bannedBy: JSONNull?? = nil,
        authorFlairType: FlairType? = nil,
        contestMode: Bool? = nil,
        selftextHTML: String?? = nil,
        likes: JSONNull?? = nil,
        suggestedSort: String?? = nil,
        bannedAtUTC: JSONNull?? = nil,
        viewCount: JSONNull?? = nil,
        archived: Bool? = nil,
        noFollow: Bool? = nil,
        isCrosspostable: Bool? = nil,
        pinned: Bool? = nil,
        over18: Bool? = nil,
        preview: Preview?? = nil,
        mediaOnly: Bool? = nil,
        linkFlairTemplateID: String?? = nil,
        canGild: Bool? = nil,
        spoiler: Bool? = nil,
        locked: Bool? = nil,
        authorFlairText: String?? = nil,
        visited: Bool? = nil,
        numReports: JSONNull?? = nil,
        distinguished: JSONNull?? = nil,
        subredditID: String? = nil,
        modReasonBy: JSONNull?? = nil,
        removalReason: JSONNull?? = nil,
        linkFlairBackgroundColor: LinkFlairBackgroundColor? = nil,
        id: String? = nil,
        reportReasons: JSONNull?? = nil,
        author: String? = nil,
        numCrossposts: Int? = nil,
        numComments: Int? = nil,
        sendReplies: Bool? = nil,
        modReports: [JSONAny]? = nil,
        authorFlairTextColor: String?? = nil,
        permalink: String? = nil,
        whitelistStatus: WhitelistStatus? = nil,
        stickied: Bool? = nil,
        url: String? = nil,
        subredditSubscribers: Int? = nil,
        createdUTC: Double? = nil,
        media: JSONNull?? = nil,
        isVideo: Bool? = nil
    ) -> ChildData {
        return ChildData(
            approvedAtUTC: approvedAtUTC ?? self.approvedAtUTC,
            subreddit: subreddit ?? self.subreddit,
            selftext: selftext ?? self.selftext,
            userReports: userReports ?? self.userReports,
            saved: saved ?? self.saved,
            modReasonTitle: modReasonTitle ?? self.modReasonTitle,
            gilded: gilded ?? self.gilded,
            clicked: clicked ?? self.clicked,
            title: title ?? self.title,
            linkFlairRichtext: linkFlairRichtext ?? self.linkFlairRichtext,
            subredditNamePrefixed: subredditNamePrefixed ?? self.subredditNamePrefixed,
            hidden: hidden ?? self.hidden,
            pwls: pwls ?? self.pwls,
            linkFlairCSSClass: linkFlairCSSClass ?? self.linkFlairCSSClass,
            downs: downs ?? self.downs,
            thumbnailHeight: thumbnailHeight ?? self.thumbnailHeight,
            parentWhitelistStatus: parentWhitelistStatus ?? self.parentWhitelistStatus,
            hideScore: hideScore ?? self.hideScore,
            name: name ?? self.name,
            quarantine: quarantine ?? self.quarantine,
            linkFlairTextColor: linkFlairTextColor ?? self.linkFlairTextColor,
            authorFlairBackgroundColor: authorFlairBackgroundColor ?? self.authorFlairBackgroundColor,
            subredditType: subredditType ?? self.subredditType,
            ups: ups ?? self.ups,
            domain: domain ?? self.domain,
            mediaEmbed: mediaEmbed ?? self.mediaEmbed,
            thumbnailWidth: thumbnailWidth ?? self.thumbnailWidth,
            authorFlairTemplateID: authorFlairTemplateID ?? self.authorFlairTemplateID,
            isOriginalContent: isOriginalContent ?? self.isOriginalContent,
            secureMedia: secureMedia ?? self.secureMedia,
            isRedditMediaDomain: isRedditMediaDomain ?? self.isRedditMediaDomain,
            isMeta: isMeta ?? self.isMeta,
            category: category ?? self.category,
            secureMediaEmbed: secureMediaEmbed ?? self.secureMediaEmbed,
            linkFlairText: linkFlairText ?? self.linkFlairText,
            canModPost: canModPost ?? self.canModPost,
            score: score ?? self.score,
            approvedBy: approvedBy ?? self.approvedBy,
            thumbnail: thumbnail ?? self.thumbnail,
            edited: edited ?? self.edited,
            authorFlairCSSClass: authorFlairCSSClass ?? self.authorFlairCSSClass,
            authorFlairRichtext: authorFlairRichtext ?? self.authorFlairRichtext,
            postHint: postHint ?? self.postHint,
            contentCategories: contentCategories ?? self.contentCategories,
            isSelf: isSelf ?? self.isSelf,
            modNote: modNote ?? self.modNote,
            created: created ?? self.created,
            linkFlairType: linkFlairType ?? self.linkFlairType,
            wls: wls ?? self.wls,
            bannedBy: bannedBy ?? self.bannedBy,
            authorFlairType: authorFlairType ?? self.authorFlairType,
            contestMode: contestMode ?? self.contestMode,
            selftextHTML: selftextHTML ?? self.selftextHTML,
            likes: likes ?? self.likes,
            suggestedSort: suggestedSort ?? self.suggestedSort,
            bannedAtUTC: bannedAtUTC ?? self.bannedAtUTC,
            viewCount: viewCount ?? self.viewCount,
            archived: archived ?? self.archived,
            noFollow: noFollow ?? self.noFollow,
            isCrosspostable: isCrosspostable ?? self.isCrosspostable,
            pinned: pinned ?? self.pinned,
            over18: over18 ?? self.over18,
            preview: preview ?? self.preview,
            mediaOnly: mediaOnly ?? self.mediaOnly,
            linkFlairTemplateID: linkFlairTemplateID ?? self.linkFlairTemplateID,
            canGild: canGild ?? self.canGild,
            spoiler: spoiler ?? self.spoiler,
            locked: locked ?? self.locked,
            authorFlairText: authorFlairText ?? self.authorFlairText,
            visited: visited ?? self.visited,
            numReports: numReports ?? self.numReports,
            distinguished: distinguished ?? self.distinguished,
            subredditID: subredditID ?? self.subredditID,
            modReasonBy: modReasonBy ?? self.modReasonBy,
            removalReason: removalReason ?? self.removalReason,
            linkFlairBackgroundColor: linkFlairBackgroundColor ?? self.linkFlairBackgroundColor,
            id: id ?? self.id,
            reportReasons: reportReasons ?? self.reportReasons,
            author: author ?? self.author,
            numCrossposts: numCrossposts ?? self.numCrossposts,
            numComments: numComments ?? self.numComments,
            sendReplies: sendReplies ?? self.sendReplies,
            modReports: modReports ?? self.modReports,
            authorFlairTextColor: authorFlairTextColor ?? self.authorFlairTextColor,
            permalink: permalink ?? self.permalink,
            whitelistStatus: whitelistStatus ?? self.whitelistStatus,
            stickied: stickied ?? self.stickied,
            url: url ?? self.url,
            subredditSubscribers: subredditSubscribers ?? self.subredditSubscribers,
            createdUTC: createdUTC ?? self.createdUTC,
            media: media ?? self.media,
            isVideo: isVideo ?? self.isVideo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension AuthorFlairRichtext {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AuthorFlairRichtext.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        e: String? = nil,
        t: String? = nil
    ) -> AuthorFlairRichtext {
        return AuthorFlairRichtext(
            e: e ?? self.e,
            t: t ?? self.t
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension LinkFlairRichtext {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(LinkFlairRichtext.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        e: String? = nil,
        t: String?? = nil,
        a: String?? = nil,
        u: String?? = nil
    ) -> LinkFlairRichtext {
        return LinkFlairRichtext(
            e: e ?? self.e,
            t: t ?? self.t,
            a: a ?? self.a,
            u: u ?? self.u
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension MediaEmbed {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(MediaEmbed.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
    ) -> MediaEmbed {
        return MediaEmbed(
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Preview {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Preview.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        images: [Image]? = nil,
        enabled: Bool? = nil,
        redditVideoPreview: RedditVideoPreview?? = nil
    ) -> Preview {
        return Preview(
            images: images ?? self.images,
            enabled: enabled ?? self.enabled,
            redditVideoPreview: redditVideoPreview ?? self.redditVideoPreview
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Image {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Image.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        source: Source? = nil,
        resolutions: [Source]? = nil,
        variants: Variants? = nil,
        id: String? = nil
    ) -> Image {
        return Image(
            source: source ?? self.source,
            resolutions: resolutions ?? self.resolutions,
            variants: variants ?? self.variants,
            id: id ?? self.id
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Source {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Source.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        url: String? = nil,
        width: Int? = nil,
        height: Int? = nil
    ) -> Source {
        return Source(
            url: url ?? self.url,
            width: width ?? self.width,
            height: height ?? self.height
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Variants {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Variants.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        gif: GIF?? = nil,
        mp4: GIF?? = nil
    ) -> Variants {
        return Variants(
            gif: gif ?? self.gif,
            mp4: mp4 ?? self.mp4
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension GIF {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GIF.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        source: Source? = nil,
        resolutions: [Source]? = nil
    ) -> GIF {
        return GIF(
            source: source ?? self.source,
            resolutions: resolutions ?? self.resolutions
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension RedditVideoPreview {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(RedditVideoPreview.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        fallbackURL: String? = nil,
        height: Int? = nil,
        width: Int? = nil,
        scrubberMediaURL: String? = nil,
        dashURL: String? = nil,
        duration: Int? = nil,
        hlsURL: String? = nil,
        isGIF: Bool? = nil,
        transcodingStatus: String? = nil
    ) -> RedditVideoPreview {
        return RedditVideoPreview(
            fallbackURL: fallbackURL ?? self.fallbackURL,
            height: height ?? self.height,
            width: width ?? self.width,
            scrubberMediaURL: scrubberMediaURL ?? self.scrubberMediaURL,
            dashURL: dashURL ?? self.dashURL,
            duration: duration ?? self.duration,
            hlsURL: hlsURL ?? self.hlsURL,
            isGIF: isGIF ?? self.isGIF,
            transcodingStatus: transcodingStatus ?? self.transcodingStatus
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: Encode/decode helpers

class JSONNull: Codable {
    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
