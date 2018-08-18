// To parse this JSON:
//
//   NSError *error;
//   QTReddit *reddit = [QTReddit fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class QTReddit;
@class QTRedditData;
@class QTChild;
@class QTChildData;
@class QTAuthorFlairRichtext;
@class QTFlairType;
@class QTLinkFlairBackgroundColor;
@class QTLinkFlairRichtext;
@class QTLinkFlairTextColor;
@class QTMediaEmbed;
@class QTWhitelistStatus;
@class QTPostHint;
@class QTPreview;
@class QTImage;
@class QTSource;
@class QTVariants;
@class QTGIF;
@class QTRedditVideoPreview;
@class QTSubredditType;
@class QTKind;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

@interface QTFlairType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTFlairType *)richtext;
+ (QTFlairType *)text;
@end

@interface QTLinkFlairBackgroundColor : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTLinkFlairBackgroundColor *)empty;
+ (QTLinkFlairBackgroundColor *)ff4500;
+ (QTLinkFlairBackgroundColor *)the6289D1;
@end

@interface QTLinkFlairTextColor : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTLinkFlairTextColor *)dark;
+ (QTLinkFlairTextColor *)light;
@end

@interface QTWhitelistStatus : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTWhitelistStatus *)allAds;
+ (QTWhitelistStatus *)houseOnly;
+ (QTWhitelistStatus *)promoAll;
@end

@interface QTPostHint : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTPostHint *)image;
+ (QTPostHint *)link;
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
@property (nonatomic, copy)           NSString *modhash;
@property (nonatomic, assign)         NSInteger dist;
@property (nonatomic, copy)           NSArray<QTChild *> *children;
@property (nonatomic, copy)           NSString *after;
@property (nonatomic, nullable, copy) id before;
@end

@interface QTChild : NSObject
@property (nonatomic, assign) QTKind *kind;
@property (nonatomic, strong) QTChildData *data;
@end

@interface QTChildData : NSObject
@property (nonatomic, nullable, copy)   id approvedAtUTC;
@property (nonatomic, copy)             NSString *subreddit;
@property (nonatomic, copy)             NSString *selftext;
@property (nonatomic, copy)             NSArray *userReports;
@property (nonatomic, assign)           BOOL isSaved;
@property (nonatomic, nullable, copy)   id modReasonTitle;
@property (nonatomic, assign)           NSInteger gilded;
@property (nonatomic, assign)           BOOL isClicked;
@property (nonatomic, copy)             NSString *title;
@property (nonatomic, copy)             NSArray<QTLinkFlairRichtext *> *linkFlairRichtext;
@property (nonatomic, copy)             NSString *subredditNamePrefixed;
@property (nonatomic, assign)           BOOL isHidden;
@property (nonatomic, assign)           NSInteger pwls;
@property (nonatomic, nullable, copy)   NSString *linkFlairCSSClass;
@property (nonatomic, assign)           NSInteger downs;
@property (nonatomic, nullable, strong) NSNumber *thumbnailHeight;
@property (nonatomic, assign)           QTWhitelistStatus *parentWhitelistStatus;
@property (nonatomic, assign)           BOOL isHideScore;
@property (nonatomic, copy)             NSString *name;
@property (nonatomic, assign)           BOOL isQuarantine;
@property (nonatomic, assign)           QTLinkFlairTextColor *linkFlairTextColor;
@property (nonatomic, nullable, copy)   NSString *authorFlairBackgroundColor;
@property (nonatomic, assign)           QTSubredditType *subredditType;
@property (nonatomic, assign)           NSInteger ups;
@property (nonatomic, copy)             NSString *domain;
@property (nonatomic, strong)           QTMediaEmbed *mediaEmbed;
@property (nonatomic, nullable, strong) NSNumber *thumbnailWidth;
@property (nonatomic, nullable, copy)   id authorFlairTemplateID;
@property (nonatomic, assign)           BOOL isOriginalContent;
@property (nonatomic, nullable, copy)   id secureMedia;
@property (nonatomic, assign)           BOOL isRedditMediaDomain;
@property (nonatomic, assign)           BOOL isMeta;
@property (nonatomic, nullable, copy)   id category;
@property (nonatomic, strong)           QTMediaEmbed *secureMediaEmbed;
@property (nonatomic, nullable, copy)   NSString *linkFlairText;
@property (nonatomic, assign)           BOOL isCanModPost;
@property (nonatomic, assign)           NSInteger score;
@property (nonatomic, nullable, copy)   id approvedBy;
@property (nonatomic, copy)             NSString *thumbnail;
@property (nonatomic, copy)             id edited;
@property (nonatomic, nullable, copy)   NSString *authorFlairCSSClass;
@property (nonatomic, copy)             NSArray<QTAuthorFlairRichtext *> *authorFlairRichtext;
@property (nonatomic, nullable, assign) QTPostHint *postHint;
@property (nonatomic, nullable, copy)   NSArray<NSString *> *contentCategories;
@property (nonatomic, assign)           BOOL isSelf;
@property (nonatomic, nullable, copy)   id modNote;
@property (nonatomic, assign)           double created;
@property (nonatomic, assign)           QTFlairType *linkFlairType;
@property (nonatomic, assign)           NSInteger wls;
@property (nonatomic, nullable, copy)   id bannedBy;
@property (nonatomic, assign)           QTFlairType *authorFlairType;
@property (nonatomic, assign)           BOOL isContestMode;
@property (nonatomic, nullable, copy)   NSString *selftextHTML;
@property (nonatomic, nullable, copy)   id likes;
@property (nonatomic, nullable, copy)   NSString *suggestedSort;
@property (nonatomic, nullable, copy)   id bannedAtUTC;
@property (nonatomic, nullable, copy)   id viewCount;
@property (nonatomic, assign)           BOOL isArchived;
@property (nonatomic, assign)           BOOL isNoFollow;
@property (nonatomic, assign)           BOOL isCrosspostable;
@property (nonatomic, assign)           BOOL isPinned;
@property (nonatomic, assign)           BOOL isOver18;
@property (nonatomic, nullable, strong) QTPreview *preview;
@property (nonatomic, assign)           BOOL isMediaOnly;
@property (nonatomic, nullable, copy)   NSString *linkFlairTemplateID;
@property (nonatomic, assign)           BOOL isCanGild;
@property (nonatomic, assign)           BOOL isSpoiler;
@property (nonatomic, assign)           BOOL isLocked;
@property (nonatomic, nullable, copy)   NSString *authorFlairText;
@property (nonatomic, assign)           BOOL isVisited;
@property (nonatomic, nullable, copy)   id numReports;
@property (nonatomic, nullable, copy)   id distinguished;
@property (nonatomic, copy)             NSString *subredditID;
@property (nonatomic, nullable, copy)   id modReasonBy;
@property (nonatomic, nullable, copy)   id removalReason;
@property (nonatomic, assign)           QTLinkFlairBackgroundColor *linkFlairBackgroundColor;
@property (nonatomic, copy)             NSString *identifier;
@property (nonatomic, nullable, copy)   id reportReasons;
@property (nonatomic, copy)             NSString *author;
@property (nonatomic, assign)           NSInteger numCrossposts;
@property (nonatomic, assign)           NSInteger numComments;
@property (nonatomic, assign)           BOOL isSendReplies;
@property (nonatomic, copy)             NSArray *modReports;
@property (nonatomic, nullable, copy)   NSString *authorFlairTextColor;
@property (nonatomic, copy)             NSString *permalink;
@property (nonatomic, assign)           QTWhitelistStatus *whitelistStatus;
@property (nonatomic, assign)           BOOL isStickied;
@property (nonatomic, copy)             NSString *url;
@property (nonatomic, assign)           NSInteger subredditSubscribers;
@property (nonatomic, assign)           double createdUTC;
@property (nonatomic, nullable, copy)   id media;
@property (nonatomic, assign)           BOOL isVideo;
@end

@interface QTAuthorFlairRichtext : NSObject
@property (nonatomic, copy) NSString *e;
@property (nonatomic, copy) NSString *t;
@end

@interface QTLinkFlairRichtext : NSObject
@property (nonatomic, copy)           NSString *e;
@property (nonatomic, nullable, copy) NSString *t;
@property (nonatomic, nullable, copy) NSString *a;
@property (nonatomic, nullable, copy) NSString *u;
@end

@interface QTMediaEmbed : NSObject
@end

@interface QTPreview : NSObject
@property (nonatomic, copy)             NSArray<QTImage *> *images;
@property (nonatomic, assign)           BOOL isEnabled;
@property (nonatomic, nullable, strong) QTRedditVideoPreview *redditVideoPreview;
@end

@interface QTImage : NSObject
@property (nonatomic, strong) QTSource *source;
@property (nonatomic, copy)   NSArray<QTSource *> *resolutions;
@property (nonatomic, strong) QTVariants *variants;
@property (nonatomic, copy)   NSString *identifier;
@end

@interface QTSource : NSObject
@property (nonatomic, copy)   NSString *url;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@end

@interface QTVariants : NSObject
@property (nonatomic, nullable, strong) QTGIF *gif;
@property (nonatomic, nullable, strong) QTGIF *mp4;
@end

@interface QTGIF : NSObject
@property (nonatomic, strong) QTSource *source;
@property (nonatomic, copy)   NSArray<QTSource *> *resolutions;
@end

@interface QTRedditVideoPreview : NSObject
@property (nonatomic, copy)   NSString *fallbackURL;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, copy)   NSString *scrubberMediaURL;
@property (nonatomic, copy)   NSString *dashURL;
@property (nonatomic, assign) NSInteger duration;
@property (nonatomic, copy)   NSString *hlsURL;
@property (nonatomic, assign) BOOL isGIF;
@property (nonatomic, copy)   NSString *transcodingStatus;
@end

NS_ASSUME_NONNULL_END
