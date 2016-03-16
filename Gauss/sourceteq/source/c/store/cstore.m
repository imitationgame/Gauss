#import "cstore.h"

@interface cstore ()

@property(strong, nonatomic)vstore *view;

@end

@implementation cstore

@dynamic view;

+(void)show
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       cstore *controller = [[cstore alloc] init];
                       [[cmain singleton] pushViewController:controller animated:YES];
                   });
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(![mstore singleton].purchases)
    {
        [mstore singleton].purchases = [[mstorepurchases alloc] init];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:[mstore singleton]];
    }
    
    [[mstore singleton] checkavailabilities];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)loadView
{
    self.view = [[vstore alloc] init:self];
}

#pragma mark public

-(void)back
{
    [[cmain singleton] popViewControllerAnimated:YES];
}

@end