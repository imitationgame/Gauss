#import <UIKit/UIKit.h>

@class mcourseitemchapter;

@interface mcourseitem:NSObject

@property(copy, nonatomic)NSString *uniqueid;
@property(copy, nonatomic)NSString *name;
@property(strong, nonatomic)NSArray<mcourseitemchapter*> *chapters;
@property(nonatomic)NSUInteger dbid;
@property(nonatomic)BOOL available;

@end