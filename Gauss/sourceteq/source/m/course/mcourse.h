#import "appdel.h"

@class mcourseitem;

@interface mcourse:NSObject

+(instancetype)singleton;
-(NSUInteger)count;
-(mcourseitem*)course:(NSUInteger)index;

@property(nonatomic)BOOL loaded;

@end