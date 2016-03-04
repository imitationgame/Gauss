#import "appdel.h"

@class mcourseitem;
@class mcourseitemchapter;

@interface mcourse:NSObject

+(void)opencourse:(Class)courseclass;
+(void)openchapter:(mcourseitemchapter*)chapter;
+(instancetype)singleton;
-(NSUInteger)count;
-(mcourseitem*)course:(NSUInteger)index;

@property(nonatomic)BOOL loaded;

@end