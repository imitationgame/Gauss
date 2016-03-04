#import <UIKit/UIKit.h>

@class mcourseitemchapter;

@interface mcourseitem:NSObject

@property(readonly, copy, nonatomic)NSString *name;
@property(readonly, strong, nonatomic)NSArray<mcourseitemchapter*> *chapters;

@end