#import "appdel.h"

@class mcourseitem;
@class mcourseitemchapter;

@interface mcourse:NSObject

+(void)opencourse:(Class)courseclass;
+(BOOL)opennextchapter:(mcourseitemchapter*)chapter;
+(instancetype)singleton;
-(void)ready;

@property(strong, nonatomic)NSArray<mcourseitem*> *courses;

@end