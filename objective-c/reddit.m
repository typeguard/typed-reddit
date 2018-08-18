#import "reddit.h"

#define λ(decl, expr) (^(decl) { return (expr); })

static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

@interface QTReddit (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTRedditData (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTChild (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTChildData (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTAuthorFlairRichtext (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTLinkFlairRichtext (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTMediaEmbed (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTPreview (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTImage (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTSource (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTVariants (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTGIF (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTRedditVideoPreview (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@implementation QTFlairType
+ (NSDictionary<NSString *, QTFlairType *> *)values
{
    static NSDictionary<NSString *, QTFlairType *> *values;
    return values = values ? values : @{
        @"richtext": [[QTFlairType alloc] initWithValue:@"richtext"],
        @"text": [[QTFlairType alloc] initWithValue:@"text"],
    };
}

+ (QTFlairType *)richtext { return QTFlairType.values[@"richtext"]; }
+ (QTFlairType *)text { return QTFlairType.values[@"text"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTFlairType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTLinkFlairBackgroundColor
+ (NSDictionary<NSString *, QTLinkFlairBackgroundColor *> *)values
{
    static NSDictionary<NSString *, QTLinkFlairBackgroundColor *> *values;
    return values = values ? values : @{
        @"": [[QTLinkFlairBackgroundColor alloc] initWithValue:@""],
        @"#ff4500": [[QTLinkFlairBackgroundColor alloc] initWithValue:@"#ff4500"],
        @"#6289d1": [[QTLinkFlairBackgroundColor alloc] initWithValue:@"#6289d1"],
    };
}

+ (QTLinkFlairBackgroundColor *)empty { return QTLinkFlairBackgroundColor.values[@""]; }
+ (QTLinkFlairBackgroundColor *)ff4500 { return QTLinkFlairBackgroundColor.values[@"#ff4500"]; }
+ (QTLinkFlairBackgroundColor *)the6289D1 { return QTLinkFlairBackgroundColor.values[@"#6289d1"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTLinkFlairBackgroundColor.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTLinkFlairTextColor
+ (NSDictionary<NSString *, QTLinkFlairTextColor *> *)values
{
    static NSDictionary<NSString *, QTLinkFlairTextColor *> *values;
    return values = values ? values : @{
        @"dark": [[QTLinkFlairTextColor alloc] initWithValue:@"dark"],
        @"light": [[QTLinkFlairTextColor alloc] initWithValue:@"light"],
    };
}

+ (QTLinkFlairTextColor *)dark { return QTLinkFlairTextColor.values[@"dark"]; }
+ (QTLinkFlairTextColor *)light { return QTLinkFlairTextColor.values[@"light"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTLinkFlairTextColor.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTWhitelistStatus
+ (NSDictionary<NSString *, QTWhitelistStatus *> *)values
{
    static NSDictionary<NSString *, QTWhitelistStatus *> *values;
    return values = values ? values : @{
        @"all_ads": [[QTWhitelistStatus alloc] initWithValue:@"all_ads"],
        @"house_only": [[QTWhitelistStatus alloc] initWithValue:@"house_only"],
        @"promo_all": [[QTWhitelistStatus alloc] initWithValue:@"promo_all"],
    };
}

+ (QTWhitelistStatus *)allAds { return QTWhitelistStatus.values[@"all_ads"]; }
+ (QTWhitelistStatus *)houseOnly { return QTWhitelistStatus.values[@"house_only"]; }
+ (QTWhitelistStatus *)promoAll { return QTWhitelistStatus.values[@"promo_all"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTWhitelistStatus.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTPostHint
+ (NSDictionary<NSString *, QTPostHint *> *)values
{
    static NSDictionary<NSString *, QTPostHint *> *values;
    return values = values ? values : @{
        @"image": [[QTPostHint alloc] initWithValue:@"image"],
        @"link": [[QTPostHint alloc] initWithValue:@"link"],
        @"self": [[QTPostHint alloc] initWithValue:@"self"],
    };
}

+ (QTPostHint *)image { return QTPostHint.values[@"image"]; }
+ (QTPostHint *)link { return QTPostHint.values[@"link"]; }
+ (QTPostHint *)self { return QTPostHint.values[@"self"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTPostHint.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTSubredditType
+ (NSDictionary<NSString *, QTSubredditType *> *)values
{
    static NSDictionary<NSString *, QTSubredditType *> *values;
    return values = values ? values : @{
        @"public": [[QTSubredditType alloc] initWithValue:@"public"],
    };
}

+ (QTSubredditType *)public { return QTSubredditType.values[@"public"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTSubredditType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTKind
+ (NSDictionary<NSString *, QTKind *> *)values
{
    static NSDictionary<NSString *, QTKind *> *values;
    return values = values ? values : @{
        @"t3": [[QTKind alloc] initWithValue:@"t3"],
    };
}

+ (QTKind *)t3 { return QTKind.values[@"t3"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTKind.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

static id map(id collection, id (^f)(id value)) {
    id result = nil;
    if ([collection isKindOfClass:NSArray.class]) {
        result = [NSMutableArray arrayWithCapacity:[collection count]];
        for (id x in collection) [result addObject:f(x)];
    } else if ([collection isKindOfClass:NSDictionary.class]) {
        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
    }
    return result;
}

#pragma mark - JSON serialization

QTReddit *_Nullable QTRedditFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [QTReddit fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

QTReddit *_Nullable QTRedditFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return QTRedditFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable QTRedditToData(QTReddit *reddit, NSError **error)
{
    @try {
        id json = [reddit JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable QTRedditToJSON(QTReddit *reddit, NSStringEncoding encoding, NSError **error)
{
    NSData *data = QTRedditToData(reddit, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation QTReddit
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"kind": @"kind",
        @"data": @"data",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return QTRedditFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTRedditFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTReddit alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _data = [QTRedditData fromJSONDictionary:(id)_data];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTReddit.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"data": [_data JSONDictionary],
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return QTRedditToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTRedditToJSON(self, encoding, error);
}
@end

@implementation QTRedditData
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"modhash": @"modhash",
        @"dist": @"dist",
        @"children": @"children",
        @"after": @"after",
        @"before": @"before",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTRedditData alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _children = map(_children, λ(id x, [QTChild fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTRedditData.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"children": map(_children, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation QTChild
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"kind": @"kind",
        @"data": @"data",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTChild alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _kind = [QTKind withValue:(id)_kind];
        _data = [QTChildData fromJSONDictionary:(id)_data];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTChild.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"kind": [_kind value],
        @"data": [_data JSONDictionary],
    }];

    return dict;
}
@end

@implementation QTChildData
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"approved_at_utc": @"approvedAtUTC",
        @"subreddit": @"subreddit",
        @"selftext": @"selftext",
        @"user_reports": @"userReports",
        @"saved": @"isSaved",
        @"mod_reason_title": @"modReasonTitle",
        @"gilded": @"gilded",
        @"clicked": @"isClicked",
        @"title": @"title",
        @"link_flair_richtext": @"linkFlairRichtext",
        @"subreddit_name_prefixed": @"subredditNamePrefixed",
        @"hidden": @"isHidden",
        @"pwls": @"pwls",
        @"link_flair_css_class": @"linkFlairCSSClass",
        @"downs": @"downs",
        @"thumbnail_height": @"thumbnailHeight",
        @"parent_whitelist_status": @"parentWhitelistStatus",
        @"hide_score": @"isHideScore",
        @"name": @"name",
        @"quarantine": @"isQuarantine",
        @"link_flair_text_color": @"linkFlairTextColor",
        @"author_flair_background_color": @"authorFlairBackgroundColor",
        @"subreddit_type": @"subredditType",
        @"ups": @"ups",
        @"domain": @"domain",
        @"media_embed": @"mediaEmbed",
        @"thumbnail_width": @"thumbnailWidth",
        @"author_flair_template_id": @"authorFlairTemplateID",
        @"is_original_content": @"isOriginalContent",
        @"secure_media": @"secureMedia",
        @"is_reddit_media_domain": @"isRedditMediaDomain",
        @"is_meta": @"isMeta",
        @"category": @"category",
        @"secure_media_embed": @"secureMediaEmbed",
        @"link_flair_text": @"linkFlairText",
        @"can_mod_post": @"isCanModPost",
        @"score": @"score",
        @"approved_by": @"approvedBy",
        @"thumbnail": @"thumbnail",
        @"edited": @"edited",
        @"author_flair_css_class": @"authorFlairCSSClass",
        @"author_flair_richtext": @"authorFlairRichtext",
        @"post_hint": @"postHint",
        @"content_categories": @"contentCategories",
        @"is_self": @"isSelf",
        @"mod_note": @"modNote",
        @"created": @"created",
        @"link_flair_type": @"linkFlairType",
        @"wls": @"wls",
        @"banned_by": @"bannedBy",
        @"author_flair_type": @"authorFlairType",
        @"contest_mode": @"isContestMode",
        @"selftext_html": @"selftextHTML",
        @"likes": @"likes",
        @"suggested_sort": @"suggestedSort",
        @"banned_at_utc": @"bannedAtUTC",
        @"view_count": @"viewCount",
        @"archived": @"isArchived",
        @"no_follow": @"isNoFollow",
        @"is_crosspostable": @"isCrosspostable",
        @"pinned": @"isPinned",
        @"over_18": @"isOver18",
        @"preview": @"preview",
        @"media_only": @"isMediaOnly",
        @"link_flair_template_id": @"linkFlairTemplateID",
        @"can_gild": @"isCanGild",
        @"spoiler": @"isSpoiler",
        @"locked": @"isLocked",
        @"author_flair_text": @"authorFlairText",
        @"visited": @"isVisited",
        @"num_reports": @"numReports",
        @"distinguished": @"distinguished",
        @"subreddit_id": @"subredditID",
        @"mod_reason_by": @"modReasonBy",
        @"removal_reason": @"removalReason",
        @"link_flair_background_color": @"linkFlairBackgroundColor",
        @"id": @"identifier",
        @"report_reasons": @"reportReasons",
        @"author": @"author",
        @"num_crossposts": @"numCrossposts",
        @"num_comments": @"numComments",
        @"send_replies": @"isSendReplies",
        @"mod_reports": @"modReports",
        @"author_flair_text_color": @"authorFlairTextColor",
        @"permalink": @"permalink",
        @"whitelist_status": @"whitelistStatus",
        @"stickied": @"isStickied",
        @"url": @"url",
        @"subreddit_subscribers": @"subredditSubscribers",
        @"created_utc": @"createdUTC",
        @"media": @"media",
        @"is_video": @"isVideo",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTChildData alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _linkFlairRichtext = map(_linkFlairRichtext, λ(id x, [QTLinkFlairRichtext fromJSONDictionary:x]));
        _parentWhitelistStatus = [QTWhitelistStatus withValue:(id)_parentWhitelistStatus];
        _linkFlairTextColor = [QTLinkFlairTextColor withValue:(id)_linkFlairTextColor];
        _subredditType = [QTSubredditType withValue:(id)_subredditType];
        _mediaEmbed = [QTMediaEmbed fromJSONDictionary:(id)_mediaEmbed];
        _secureMediaEmbed = [QTMediaEmbed fromJSONDictionary:(id)_secureMediaEmbed];
        _authorFlairRichtext = map(_authorFlairRichtext, λ(id x, [QTAuthorFlairRichtext fromJSONDictionary:x]));
        _postHint = [QTPostHint withValue:(id)_postHint];
        _linkFlairType = [QTFlairType withValue:(id)_linkFlairType];
        _authorFlairType = [QTFlairType withValue:(id)_authorFlairType];
        _preview = [QTPreview fromJSONDictionary:(id)_preview];
        _linkFlairBackgroundColor = [QTLinkFlairBackgroundColor withValue:(id)_linkFlairBackgroundColor];
        _whitelistStatus = [QTWhitelistStatus withValue:(id)_whitelistStatus];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = QTChildData.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTChildData.properties.allValues] mutableCopy];

    for (id jsonName in QTChildData.properties) {
        id propertyName = QTChildData.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"saved": _isSaved ? @YES : @NO,
        @"clicked": _isClicked ? @YES : @NO,
        @"link_flair_richtext": map(_linkFlairRichtext, λ(id x, [x JSONDictionary])),
        @"hidden": _isHidden ? @YES : @NO,
        @"parent_whitelist_status": [_parentWhitelistStatus value],
        @"hide_score": _isHideScore ? @YES : @NO,
        @"quarantine": _isQuarantine ? @YES : @NO,
        @"link_flair_text_color": [_linkFlairTextColor value],
        @"subreddit_type": [_subredditType value],
        @"media_embed": [_mediaEmbed JSONDictionary],
        @"is_original_content": _isOriginalContent ? @YES : @NO,
        @"is_reddit_media_domain": _isRedditMediaDomain ? @YES : @NO,
        @"is_meta": _isMeta ? @YES : @NO,
        @"secure_media_embed": [_secureMediaEmbed JSONDictionary],
        @"can_mod_post": _isCanModPost ? @YES : @NO,
        @"author_flair_richtext": map(_authorFlairRichtext, λ(id x, [x JSONDictionary])),
        @"post_hint": NSNullify([_postHint value]),
        @"is_self": _isSelf ? @YES : @NO,
        @"link_flair_type": [_linkFlairType value],
        @"author_flair_type": [_authorFlairType value],
        @"contest_mode": _isContestMode ? @YES : @NO,
        @"archived": _isArchived ? @YES : @NO,
        @"no_follow": _isNoFollow ? @YES : @NO,
        @"is_crosspostable": _isCrosspostable ? @YES : @NO,
        @"pinned": _isPinned ? @YES : @NO,
        @"over_18": _isOver18 ? @YES : @NO,
        @"preview": NSNullify([_preview JSONDictionary]),
        @"media_only": _isMediaOnly ? @YES : @NO,
        @"can_gild": _isCanGild ? @YES : @NO,
        @"spoiler": _isSpoiler ? @YES : @NO,
        @"locked": _isLocked ? @YES : @NO,
        @"visited": _isVisited ? @YES : @NO,
        @"link_flair_background_color": [_linkFlairBackgroundColor value],
        @"send_replies": _isSendReplies ? @YES : @NO,
        @"whitelist_status": [_whitelistStatus value],
        @"stickied": _isStickied ? @YES : @NO,
        @"is_video": _isVideo ? @YES : @NO,
    }];

    return dict;
}
@end

@implementation QTAuthorFlairRichtext
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"e": @"e",
        @"t": @"t",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTAuthorFlairRichtext alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTAuthorFlairRichtext.properties.allValues];
}
@end

@implementation QTLinkFlairRichtext
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"e": @"e",
        @"t": @"t",
        @"a": @"a",
        @"u": @"u",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTLinkFlairRichtext alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTLinkFlairRichtext.properties.allValues];
}
@end

@implementation QTMediaEmbed
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTMediaEmbed alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTMediaEmbed.properties.allValues];
}
@end

@implementation QTPreview
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"images": @"images",
        @"enabled": @"isEnabled",
        @"reddit_video_preview": @"redditVideoPreview",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTPreview alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _images = map(_images, λ(id x, [QTImage fromJSONDictionary:x]));
        _redditVideoPreview = [QTRedditVideoPreview fromJSONDictionary:(id)_redditVideoPreview];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = QTPreview.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTPreview.properties.allValues] mutableCopy];

    for (id jsonName in QTPreview.properties) {
        id propertyName = QTPreview.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"images": map(_images, λ(id x, [x JSONDictionary])),
        @"enabled": _isEnabled ? @YES : @NO,
        @"reddit_video_preview": NSNullify([_redditVideoPreview JSONDictionary]),
    }];

    return dict;
}
@end

@implementation QTImage
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"source": @"source",
        @"resolutions": @"resolutions",
        @"variants": @"variants",
        @"id": @"identifier",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTImage alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _source = [QTSource fromJSONDictionary:(id)_source];
        _resolutions = map(_resolutions, λ(id x, [QTSource fromJSONDictionary:x]));
        _variants = [QTVariants fromJSONDictionary:(id)_variants];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = QTImage.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTImage.properties.allValues] mutableCopy];

    for (id jsonName in QTImage.properties) {
        id propertyName = QTImage.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"source": [_source JSONDictionary],
        @"resolutions": map(_resolutions, λ(id x, [x JSONDictionary])),
        @"variants": [_variants JSONDictionary],
    }];

    return dict;
}
@end

@implementation QTSource
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"url": @"url",
        @"width": @"width",
        @"height": @"height",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTSource alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTSource.properties.allValues];
}
@end

@implementation QTVariants
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"gif": @"gif",
        @"mp4": @"mp4",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTVariants alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _gif = [QTGIF fromJSONDictionary:(id)_gif];
        _mp4 = [QTGIF fromJSONDictionary:(id)_mp4];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTVariants.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"gif": NSNullify([_gif JSONDictionary]),
        @"mp4": NSNullify([_mp4 JSONDictionary]),
    }];

    return dict;
}
@end

@implementation QTGIF
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"source": @"source",
        @"resolutions": @"resolutions",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTGIF alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _source = [QTSource fromJSONDictionary:(id)_source];
        _resolutions = map(_resolutions, λ(id x, [QTSource fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTGIF.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"source": [_source JSONDictionary],
        @"resolutions": map(_resolutions, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation QTRedditVideoPreview
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"fallback_url": @"fallbackURL",
        @"height": @"height",
        @"width": @"width",
        @"scrubber_media_url": @"scrubberMediaURL",
        @"dash_url": @"dashURL",
        @"duration": @"duration",
        @"hls_url": @"hlsURL",
        @"is_gif": @"isGIF",
        @"transcoding_status": @"transcodingStatus",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTRedditVideoPreview alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    id resolved = QTRedditVideoPreview.properties[key];
    if (resolved) [super setValue:value forKey:resolved];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTRedditVideoPreview.properties.allValues] mutableCopy];

    for (id jsonName in QTRedditVideoPreview.properties) {
        id propertyName = QTRedditVideoPreview.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"is_gif": _isGIF ? @YES : @NO,
    }];

    return dict;
}
@end

NS_ASSUME_NONNULL_END
