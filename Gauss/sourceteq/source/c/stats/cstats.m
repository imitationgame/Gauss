#import "cstats.h"

@implementation cstats

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
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

@end