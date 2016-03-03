#import "appdel.h"

@interface cpages:UIPageViewController

-(void)sectionplay;
-(void)sectionstats:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated;
-(void)sectionconfig;

@property(weak, nonatomic)UIImageView *titleview;

@end