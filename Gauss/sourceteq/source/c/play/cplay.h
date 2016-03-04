#import "appdel.h"

@class mcourseitemchapter;

@interface cplay:UIPageViewController

-(instancetype)init:(mcourseitemchapter*)chapter;

@property(weak, nonatomic)mcourseitemchapter *chapter;

@end