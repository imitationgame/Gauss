#import "cpages.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    UIImageView *titleview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [titleview setUserInteractionEnabled:NO];
    [titleview setClipsToBounds:YES];
    [titleview setContentMode:UIViewContentModeScaleAspectFit];
    [titleview setTintColor:[UIColor whiteColor]];
    [self.navigationItem setTitleView:titleview];
    self.titleview = titleview;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark actions

#pragma mark functionality

-(void)changecontroller:(UIViewController*)controller direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    NSArray *array = @[controller];
    [self setViewControllers:array direction:direction animated:animated completion:nil];
}

@end