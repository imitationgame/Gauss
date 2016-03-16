#import "cstats.h"

@interface coptions ()

@property(strong, nonatomic)voptions *view;

@end

@implementation coptions

@dynamic view;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [[analytics singleton] trackscreen:ga_screen_options];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)loadView
{
    self.view = [[voptions alloc] init:self];
}

#pragma mark public

-(void)openstats
{
    [[cmain singleton].pages sectionstats:UIPageViewControllerNavigationDirectionForward animated:YES];
}

@end