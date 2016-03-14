#import "ccontact.h"

@interface ccontact ()

@property(strong, nonatomic)vcontact *view;

@end

@implementation ccontact

@dynamic view;

+(void)show
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       ccontact *controller = [[ccontact alloc] init];
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

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)loadView
{
    self.view = [[vcontact alloc] init:self];
}

#pragma mark public

-(void)back
{
    [[cmain singleton] popViewControllerAnimated:YES];
}

@end