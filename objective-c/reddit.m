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

@interface QTMedia (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTOembed (JSONConversion)
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

@interface QTResolution (JSONConversion)
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

@implementation QTProviderName
+ (NSDictionary<NSString *, QTProviderName *> *)values
{
    static NSDictionary<NSString *, QTProviderName *> *values;
    return values = values ? values : @{
        @"Clippit": [[QTProviderName alloc] initWithValue:@"Clippit"],
        @"gfycat": [[QTProviderName alloc] initWithValue:@"gfycat"],
        @"YouTube": [[QTProviderName alloc] initWithValue:@"YouTube"],
    };
}

+ (QTProviderName *)clippit { return QTProviderName.values[@"Clippit"]; }
+ (QTProviderName *)gfycat { return QTProviderName.values[@"gfycat"]; }
+ (QTProviderName *)youTube { return QTProviderName.values[@"YouTube"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTProviderName.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTProviderURL
+ (NSDictionary<NSString *, QTProviderURL *> *)values
{
    static NSDictionary<NSString *, QTProviderURL *> *values;
    return values = values ? values : @{
        @"http://clippit.tv": [[QTProviderURL alloc] initWithValue:@"http://clippit.tv"],
        @"http://gfycat.com": [[QTProviderURL alloc] initWithValue:@"http://gfycat.com"],
        @"https://www.youtube.com/": [[QTProviderURL alloc] initWithValue:@"https://www.youtube.com/"],
    };
}

+ (QTProviderURL *)httpClippitTv { return QTProviderURL.values[@"http://clippit.tv"]; }
+ (QTProviderURL *)httpGfycatCOM { return QTProviderURL.values[@"http://gfycat.com"]; }
+ (QTProviderURL *)httpsWWWYoutubeCOM { return QTProviderURL.values[@"https://www.youtube.com/"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTProviderURL.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTOembedType
+ (NSDictionary<NSString *, QTOembedType *> *)values
{
    static NSDictionary<NSString *, QTOembedType *> *values;
    return values = values ? values : @{
        @"video": [[QTOembedType alloc] initWithValue:@"video"],
    };
}

+ (QTOembedType *)video { return QTOembedType.values[@"video"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTOembedType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTVersion
+ (NSDictionary<NSString *, QTVersion *> *)values
{
    static NSDictionary<NSString *, QTVersion *> *values;
    return values = values ? values : @{
        @"1.0": [[QTVersion alloc] initWithValue:@"1.0"],
    };
}

+ (QTVersion *)the10 { return QTVersion.values[@"1.0"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTVersion.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTMediaType
+ (NSDictionary<NSString *, QTMediaType *> *)values
{
    static NSDictionary<NSString *, QTMediaType *> *values;
    return values = values ? values : @{
        @"clippituser.tv": [[QTMediaType alloc] initWithValue:@"clippituser.tv"],
        @"gfycat.com": [[QTMediaType alloc] initWithValue:@"gfycat.com"],
        @"youtube.com": [[QTMediaType alloc] initWithValue:@"youtube.com"],
    };
}

+ (QTMediaType *)clippituserTv { return QTMediaType.values[@"clippituser.tv"]; }
+ (QTMediaType *)gfycatCOM { return QTMediaType.values[@"gfycat.com"]; }
+ (QTMediaType *)youtubeCOM { return QTMediaType.values[@"youtube.com"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTMediaType.values[value];
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
        @"promo_all": [[QTWhitelistStatus alloc] initWithValue:@"promo_all"],
        @"promo_specified": [[QTWhitelistStatus alloc] initWithValue:@"promo_specified"],
    };
}

+ (QTWhitelistStatus *)allAds { return QTWhitelistStatus.values[@"all_ads"]; }
+ (QTWhitelistStatus *)promoAll { return QTWhitelistStatus.values[@"promo_all"]; }
+ (QTWhitelistStatus *)promoSpecified { return QTWhitelistStatus.values[@"promo_specified"]; }

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
        @"rich:video": [[QTPostHint alloc] initWithValue:@"rich:video"],
        @"self": [[QTPostHint alloc] initWithValue:@"self"],
    };
}

+ (QTPostHint *)image { return QTPostHint.values[@"image"]; }
+ (QTPostHint *)link { return QTPostHint.values[@"link"]; }
+ (QTPostHint *)richVideo { return QTPostHint.values[@"rich:video"]; }
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
        @"after": @"after",
        @"dist": @"dist",
        @"modhash": @"modhash",
        @"whitelist_status": @"whitelistStatus",
        @"children": @"children",
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

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTRedditData.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTRedditData.properties.allValues] mutableCopy];

    for (id jsonName in QTRedditData.properties) {
        id propertyName = QTRedditData.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

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
        @"domain": @"domain",
        @"approved_at_utc": @"approvedAtUTC",
        @"mod_reason_by": @"modReasonBy",
        @"banned_by": @"bannedBy",
        @"num_reports": @"numReports",
        @"subreddit_id": @"subredditID",
        @"thumbnail_width": @"thumbnailWidth",
        @"subreddit": @"subreddit",
        @"selftext_html": @"selftextHTML",
        @"selftext": @"selftext",
        @"likes": @"likes",
        @"suggested_sort": @"suggestedSort",
        @"user_reports": @"userReports",
        @"secure_media": @"secureMedia",
        @"is_reddit_media_domain": @"isRedditMediaDomain",
        @"link_flair_text": @"linkFlairText",
        @"id": @"identifier",
        @"banned_at_utc": @"bannedAtUTC",
        @"mod_reason_title": @"modReasonTitle",
        @"view_count": @"viewCount",
        @"archived": @"isArchived",
        @"clicked": @"isClicked",
        @"media_embed": @"mediaEmbed",
        @"report_reasons": @"reportReasons",
        @"author": @"author",
        @"num_crossposts": @"numCrossposts",
        @"saved": @"isSaved",
        @"mod_reports": @"modReports",
        @"can_mod_post": @"isCanModPost",
        @"is_crosspostable": @"isCrosspostable",
        @"pinned": @"isPinned",
        @"score": @"score",
        @"approved_by": @"approvedBy",
        @"over_18": @"isOver18",
        @"hidden": @"isHidden",
        @"preview": @"preview",
        @"thumbnail": @"thumbnail",
        @"edited": @"isEdited",
        @"link_flair_css_class": @"linkFlairCSSClass",
        @"author_flair_css_class": @"authorFlairCSSClass",
        @"contest_mode": @"isContestMode",
        @"gilded": @"gilded",
        @"downs": @"downs",
        @"brand_safe": @"isBrandSafe",
        @"secure_media_embed": @"secureMediaEmbed",
        @"removal_reason": @"removalReason",
        @"post_hint": @"postHint",
        @"author_flair_text": @"authorFlairText",
        @"stickied": @"isStickied",
        @"can_gild": @"isCanGild",
        @"thumbnail_height": @"thumbnailHeight",
        @"parent_whitelist_status": @"parentWhitelistStatus",
        @"name": @"name",
        @"spoiler": @"isSpoiler",
        @"permalink": @"permalink",
        @"subreddit_type": @"subredditType",
        @"locked": @"isLocked",
        @"hide_score": @"isHideScore",
        @"created": @"created",
        @"url": @"url",
        @"whitelist_status": @"whitelistStatus",
        @"quarantine": @"isQuarantine",
        @"title": @"title",
        @"created_utc": @"createdUTC",
        @"subreddit_name_prefixed": @"subredditNamePrefixed",
        @"ups": @"ups",
        @"media": @"media",
        @"num_comments": @"numComments",
        @"is_self": @"isSelf",
        @"visited": @"isVisited",
        @"mod_note": @"modNote",
        @"is_video": @"isVideo",
        @"distinguished": @"distinguished",
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
        _secureMedia = [QTMedia fromJSONDictionary:(id)_secureMedia];
        _mediaEmbed = [QTMediaEmbed fromJSONDictionary:(id)_mediaEmbed];
        _preview = [QTPreview fromJSONDictionary:(id)_preview];
        _secureMediaEmbed = [QTMediaEmbed fromJSONDictionary:(id)_secureMediaEmbed];
        _postHint = [QTPostHint withValue:(id)_postHint];
        _parentWhitelistStatus = [QTWhitelistStatus withValue:(id)_parentWhitelistStatus];
        _subredditType = [QTSubredditType withValue:(id)_subredditType];
        _whitelistStatus = [QTWhitelistStatus withValue:(id)_whitelistStatus];
        _media = [QTMedia fromJSONDictionary:(id)_media];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTChildData.properties[key]];
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
        @"secure_media": NSNullify([_secureMedia JSONDictionary]),
        @"is_reddit_media_domain": _isRedditMediaDomain ? @YES : @NO,
        @"archived": _isArchived ? @YES : @NO,
        @"clicked": _isClicked ? @YES : @NO,
        @"media_embed": [_mediaEmbed JSONDictionary],
        @"saved": _isSaved ? @YES : @NO,
        @"can_mod_post": _isCanModPost ? @YES : @NO,
        @"is_crosspostable": _isCrosspostable ? @YES : @NO,
        @"pinned": _isPinned ? @YES : @NO,
        @"over_18": _isOver18 ? @YES : @NO,
        @"hidden": _isHidden ? @YES : @NO,
        @"preview": [_preview JSONDictionary],
        @"edited": _isEdited ? @YES : @NO,
        @"contest_mode": _isContestMode ? @YES : @NO,
        @"brand_safe": _isBrandSafe ? @YES : @NO,
        @"secure_media_embed": [_secureMediaEmbed JSONDictionary],
        @"post_hint": [_postHint value],
        @"stickied": _isStickied ? @YES : @NO,
        @"can_gild": _isCanGild ? @YES : @NO,
        @"parent_whitelist_status": [_parentWhitelistStatus value],
        @"spoiler": _isSpoiler ? @YES : @NO,
        @"subreddit_type": [_subredditType value],
        @"locked": _isLocked ? @YES : @NO,
        @"hide_score": _isHideScore ? @YES : @NO,
        @"whitelist_status": [_whitelistStatus value],
        @"quarantine": _isQuarantine ? @YES : @NO,
        @"media": NSNullify([_media JSONDictionary]),
        @"is_self": _isSelf ? @YES : @NO,
        @"visited": _isVisited ? @YES : @NO,
        @"is_video": _isVideo ? @YES : @NO,
    }];

    return dict;
}
@end

@implementation QTMedia
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"type": @"type",
        @"oembed": @"oembed",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTMedia alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _type = [QTMediaType withValue:(id)_type];
        _oembed = [QTOembed fromJSONDictionary:(id)_oembed];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTMedia.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"type": [_type value],
        @"oembed": [_oembed JSONDictionary],
    }];

    return dict;
}
@end

@implementation QTOembed
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"provider_url": @"providerURL",
        @"description": @"theDescription",
        @"title": @"title",
        @"thumbnail_width": @"thumbnailWidth",
        @"height": @"height",
        @"width": @"width",
        @"html": @"html",
        @"version": @"version",
        @"provider_name": @"providerName",
        @"thumbnail_url": @"thumbnailURL",
        @"type": @"type",
        @"thumbnail_height": @"thumbnailHeight",
        @"author_name": @"authorName",
        @"author_url": @"authorURL",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTOembed alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _providerURL = [QTProviderURL withValue:(id)_providerURL];
        _version = [QTVersion withValue:(id)_version];
        _providerName = [QTProviderName withValue:(id)_providerName];
        _type = [QTOembedType withValue:(id)_type];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTOembed.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTOembed.properties.allValues] mutableCopy];

    for (id jsonName in QTOembed.properties) {
        id propertyName = QTOembed.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"provider_url": [_providerURL value],
        @"version": [_version value],
        @"provider_name": [_providerName value],
        @"type": [_type value],
    }];

    return dict;
}
@end

@implementation QTMediaEmbed
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"content": @"content",
        @"width": @"width",
        @"scrolling": @"scrolling",
        @"height": @"height",
        @"media_domain_url": @"mediaDomainURL",
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

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTMediaEmbed.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTMediaEmbed.properties.allValues] mutableCopy];

    for (id jsonName in QTMediaEmbed.properties) {
        id propertyName = QTMediaEmbed.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    return dict;
}
@end

@implementation QTPreview
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"images": @"images",
        @"enabled": @"isEnabled",
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
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTPreview.properties[key]];
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
        _source = [QTResolution fromJSONDictionary:(id)_source];
        _resolutions = map(_resolutions, λ(id x, [QTResolution fromJSONDictionary:x]));
        _variants = [QTVariants fromJSONDictionary:(id)_variants];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTImage.properties[key]];
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

@implementation QTResolution
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
    return dict ? [[QTResolution alloc] initWithJSONDictionary:dict] : nil;
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
    return [self dictionaryWithValuesForKeys:QTResolution.properties.allValues];
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
        _source = [QTResolution fromJSONDictionary:(id)_source];
        _resolutions = map(_resolutions, λ(id x, [QTResolution fromJSONDictionary:x]));
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

NS_ASSUME_NONNULL_END
