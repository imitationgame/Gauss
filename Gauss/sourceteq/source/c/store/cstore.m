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
    
    [[analytics singleton] trackscreen:ga_screen_store];
    self.model = [[mstore alloc] init];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(!self.model.purchases)
    {
        self.model.purchases = [[mstorepurchases alloc] init];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self.model];
    }
    
    [self.model checkavailabilities];
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