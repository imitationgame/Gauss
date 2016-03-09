#import "cplayfinish.h"

@implementation cplayfinish

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

@end