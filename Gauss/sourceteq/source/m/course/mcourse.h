#import "appdel.h"

@class mcourseitem;

@interface mcourse:NSObject

-(NSUInteger)count;
-(mcourseitem*)course:(NSUInteger)index;

@end