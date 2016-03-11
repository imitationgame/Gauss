#import "cstats.h"

@interface coptions ()

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