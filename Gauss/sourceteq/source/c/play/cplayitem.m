#import "cplayitem.h"

@implementation cplayitem

-(instancetype)init:(mchallenge*)challenge
{
    self = [super init];
    
    self.challenge = challenge;
    
    return self;
}

-(void)loadView
{
    self.view = [[vplayitem alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end