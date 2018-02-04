// To parse this JSON:
//
//   NSError *error;
//   QTReddit *reddit = [QTReddit fromJSON:json encoding:NSUTF8Encoding error:&error]

#import <Foundation/Foundation.h>

@class QTReddit;
@class QTRedditData;
@class QTChild;
@class QTChildData;
@class QTMedia;
@class QTOembed;
@class QTProviderName;
@class QTProviderURL;
@class QTOembedType;
@class QTVersion;
@class QTMediaType;
@class QTMediaEmbed;
@class QTWhitelistStatus;
@class QTPostHint;
@class QTPreview;
@class QTImage;
@class QTResolution;
@class QTVariants;
@class QTGIF;
@class QTSubredditType;
@class QTKind;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

@interface QTProviderName : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTProviderName *)clippit;
+ (QTProviderName *)gfycat;
+ (QTProviderName *)youTube;
@end

@interface QTProviderURL : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTProviderURL *)httpClippitTv;
+ (QTProviderURL *)httpGfycatCOM;
+ (QTProviderURL *)httpsWWWYoutubeCOM;
@end

@interface QTOembedType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTOembedType *)video;
@end

@interface QTVersion : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTVersion *)the10;
@end

@interface QTMediaType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTMediaType *)clippituserTv;
+ (QTMediaType *)gfycatCOM;
+ (QTMediaType *)youtubeCOM;
@end

@interface QTWhitelistStatus : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTWhitelistStatus *)allAds;
+ (QTWhitelistStatus *)promoAll;
+ (QTWhitelistStatus *)promoSpecified;
@end

@interface QTPostHint : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTPostHint *)image;
+ (QTPostHint *)link;
+ (QTPostHint *)richVideo;
+ (QTPostHint *)self;
@end

@interface QTSubredditType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTSubredditType *)public;
@end

@interface QTKind : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTKind *)t3;
@end

#pragma mark - Object interfaces

@interface QTReddit : NSObject
@property (nonatomic, copy)   NSString *kind;
@property (nonatomic, strong) QTRedditData *data;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTRedditData : NSObject
@property (nonatomic, copy)           NSString *after;
@property (nonatomic, assign)         NSInteger dist;
@property (nonatomic, copy)           NSString *modhash;
@property (nonatomic, copy)           NSString *whitelistStatus;
@property (nonatomic, copy)           NSArray<QTChild *> *children;
@property (nonatomic, nullable, copy) id before;
@end

@interface QTChild : NSObject
@property (nonatomic, assign) QTKind *kind;
@property (nonatomic, strong) QTChildData *data;
@end

@interface QTChildData : NSObject
@property (nonatomic, copy)             NSString *domain;
@property (nonatomic, nullable, copy)   id approvedAtUTC;
@property (nonatomic, nullable, copy)   id modReasonBy;
@property (nonatomic, nullable, copy)   id bannedBy;
@property (nonatomic, nullable, copy)   id numReports;
@property (nonatomic, copy)             NSString *subredditID;
@property (nonatomic, nullable, strong) NSNumber *thumbnailWidth;
@property (nonatomic, copy)             NSString *subreddit;
@property (nonatomic, nullable, copy)   NSString *selftextHTML;
@property (nonatomic, copy)             NSString *selftext;
@property (nonatomic, nullable, copy)   id likes;
@property (nonatomic, nullable, copy)   NSString *suggestedSort;
@property (nonatomic, copy)             NSArray *userReports;
@property (nonatomic, nullable, strong) QTMedia *secureMedia;
@property (nonatomic, assign)           BOOL isRedditMediaDomain;
@property (nonatomic, nullable, copy)   NSString *linkFlairText;
@property (nonatomic, copy)             NSString *identifier;
@property (nonatomic, nullable, copy)   id bannedAtUTC;
@property (nonatomic, nullable, copy)   id modReasonTitle;
@property (nonatomic, nullable, copy)   id viewCount;
@property (nonatomic, assign)           BOOL isArchived;
@property (nonatomic, assign)           BOOL isClicked;
@property (nonatomic, strong)           QTMediaEmbed *mediaEmbed;
@property (nonatomic, nullable, copy)   id reportReasons;
@property (nonatomic, copy)             NSString *author;
@property (nonatomic, assign)           NSInteger numCrossposts;
@property (nonatomic, assign)           BOOL isSaved;
@property (nonatomic, copy)             NSArray *modReports;
@property (nonatomic, assign)           BOOL isCanModPost;
@property (nonatomic, assign)           BOOL isCrosspostable;
@property (nonatomic, assign)           BOOL isPinned;
@property (nonatomic, assign)           NSInteger score;
@property (nonatomic, nullable, copy)   id approvedBy;
@property (nonatomic, assign)           BOOL isOver18;
@property (nonatomic, assign)           BOOL isHidden;
@property (nonatomic, strong)           QTPreview *preview;
@property (nonatomic, copy)             NSString *thumbnail;
@property (nonatomic, assign)           BOOL isEdited;
@property (nonatomic, nullable, copy)   NSString *linkFlairCSSClass;
@property (nonatomic, nullable, copy)   NSString *authorFlairCSSClass;
@property (nonatomic, assign)           BOOL isContestMode;
@property (nonatomic, assign)           NSInteger gilded;
@property (nonatomic, assign)           NSInteger downs;
@property (nonatomic, assign)           BOOL isBrandSafe;
@property (nonatomic, strong)           QTMediaEmbed *secureMediaEmbed;
@property (nonatomic, nullable, copy)   id removalReason;
@property (nonatomic, assign)           QTPostHint *postHint;
@property (nonatomic, nullable, copy)   NSString *authorFlairText;
@property (nonatomic, assign)           BOOL isStickied;
@property (nonatomic, assign)           BOOL isCanGild;
@property (nonatomic, nullable, strong) NSNumber *thumbnailHeight;
@property (nonatomic, assign)           QTWhitelistStatus *parentWhitelistStatus;
@property (nonatomic, copy)             NSString *name;
@property (nonatomic, assign)           BOOL isSpoiler;
@property (nonatomic, copy)             NSString *permalink;
@property (nonatomic, assign)           QTSubredditType *subredditType;
@property (nonatomic, assign)           BOOL isLocked;
@property (nonatomic, assign)           BOOL isHideScore;
@property (nonatomic, assign)           double created;
@property (nonatomic, copy)             NSString *url;
@property (nonatomic, assign)           QTWhitelistStatus *whitelistStatus;
@property (nonatomic, assign)           BOOL isQuarantine;
@property (nonatomic, copy)             NSString *title;
@property (nonatomic, assign)           double createdUTC;
@property (nonatomic, copy)             NSString *subredditNamePrefixed;
@property (nonatomic, assign)           NSInteger ups;
@property (nonatomic, nullable, strong) QTMedia *media;
@property (nonatomic, assign)           NSInteger numComments;
@property (nonatomic, assign)           BOOL isSelf;
@property (nonatomic, assign)           BOOL isVisited;
@property (nonatomic, nullable, copy)   id modNote;
@property (nonatomic, assign)           BOOL isVideo;
@property (nonatomic, nullable, copy)   id distinguished;
@end

@interface QTMedia : NSObject
@property (nonatomic, assign) QTMediaType *type;
@property (nonatomic, strong) QTOembed *oembed;
@end

@interface QTOembed : NSObject
@property (nonatomic, assign)         QTProviderURL *providerURL;
@property (nonatomic, nullable, copy) NSString *theDescription;
@property (nonatomic, copy)           NSString *title;
@property (nonatomic, assign)         NSInteger thumbnailWidth;
@property (nonatomic, assign)         NSInteger height;
@property (nonatomic, assign)         NSInteger width;
@property (nonatomic, copy)           NSString *html;
@property (nonatomic, assign)         QTVersion *version;
@property (nonatomic, assign)         QTProviderName *providerName;
@property (nonatomic, copy)           NSString *thumbnailURL;
@property (nonatomic, assign)         QTOembedType *type;
@property (nonatomic, assign)         NSInteger thumbnailHeight;
@property (nonatomic, nullable, copy) NSString *authorName;
@property (nonatomic, nullable, copy) NSString *authorURL;
@end

@interface QTMediaEmbed : NSObject
@property (nonatomic, nullable, copy)   NSString *content;
@property (nonatomic, nullable, strong) NSNumber *width;
@property (nonatomic, nullable, strong) NSNumber *scrolling;
@property (nonatomic, nullable, strong) NSNumber *height;
@property (nonatomic, nullable, copy)   NSString *mediaDomainURL;
@end

@interface QTPreview : NSObject
@property (nonatomic, copy)   NSArray<QTImage *> *images;
@property (nonatomic, assign) BOOL isEnabled;
@end

@interface QTImage : NSObject
@property (nonatomic, strong) QTResolution *source;
@property (nonatomic, copy)   NSArray<QTResolution *> *resolutions;
@property (nonatomic, strong) QTVariants *variants;
@property (nonatomic, copy)   NSString *identifier;
@end

@interface QTResolution : NSObject
@property (nonatomic, copy)   NSString *url;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@end

@interface QTVariants : NSObject
@property (nonatomic, nullable, strong) QTGIF *gif;
@property (nonatomic, nullable, strong) QTGIF *mp4;
@end

@interface QTGIF : NSObject
@property (nonatomic, strong) QTResolution *source;
@property (nonatomic, copy)   NSArray<QTResolution *> *resolutions;
@end

NS_ASSUME_NONNULL_END
