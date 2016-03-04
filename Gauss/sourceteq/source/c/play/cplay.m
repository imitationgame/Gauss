#import "cplay.h"

@implementation cplay

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init];
    self.chapter = chapter;
    
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