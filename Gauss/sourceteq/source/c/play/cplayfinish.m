#import "cplayfinish.h"

@interface cplayfinish ()

@property(strong, nonatomic)vplayfinish *view;

@end

@implementation cplayfinish

@dynamic view;

-(instancetype)init:(cplay*)play
{
    self = [super init];
    self.play = play;
    
    return self;
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
    self.view = [[vplayfinish alloc] init:self];
}

@end