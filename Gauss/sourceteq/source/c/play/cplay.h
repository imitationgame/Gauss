#import "appdel.h"

@class mcourseitemchapter;

@interface cplay:UIPageViewController

-(instancetype)init:(mcourseitemchapter*)chapter;
-(void)playnext;

@property(weak, nonatomic)mcourseitemchapter *chapter;

@end