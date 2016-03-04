#import "appdel.h"

@class mcourseitemchapter;

@interface mcourseitem:NSObject

@property(copy, nonatomic)NSString *name;
@property(strong, nonatomic)NSArray<mcourseitemchapter*> *chapters;

@end