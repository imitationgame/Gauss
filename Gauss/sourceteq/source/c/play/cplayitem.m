#import "cplayitem.h"

@implementation cplayitem

-(instancetype)init:(cplay*)play challenge:(mchallenge*)challenge
{
    self = [super init];

    self.play = play;
    self.challenge = challenge;
    
    NSLog(@"%@", challenge);
    
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