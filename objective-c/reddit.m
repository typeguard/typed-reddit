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
        @"message": @"message",
        @"error": @"error",
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
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTReddit.properties.allValues];
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

NS_ASSUME_NONNULL_END
