// To parse this JSON:
//
//   NSError *error;
//   QTReddit *reddit = [QTReddit fromJSON:json encoding:NSUTF8Encoding error:&error]

#import <Foundation/Foundation.h>

@class QTReddit;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface QTReddit : NSObject
@property (nonatomic, copy)   NSString *message;
@property (nonatomic, assign) NSInteger error;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

NS_ASSUME_NONNULL_END
