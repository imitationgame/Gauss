#import "cstats.h"

@interface cstats ()

@property(strong, nonatomic)vstats *view;

@end

@implementation cstats

@dynamic view;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [[analytics singleton] trackscreen:ga_screen_stats];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)loadView
{
    self.view = [[vstats alloc] init:self];
}

#pragma mark public

-(void)play:(mcourseitemchapter*)chapter
{
    [[cmain singleton].pages sectionplay:chapter];
}

-(void)openoptions
{
    [[cmain singleton].pages sectionoptions];
}

@end