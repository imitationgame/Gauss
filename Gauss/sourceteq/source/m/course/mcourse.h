#import "appdel.h"

@class mcourseitem;
@class mcourseitemchapter;

@interface mcourse:NSObject

+(void)opencourse:(Class)courseclass;
+(BOOL)opennextchapter:(mcourseitemchapter*)chapter;
+(instancetype)singleton;
-(void)ready;
-(NSUInteger)count;
-(mcourseitem*)course:(NSUInteger)index;

@end