#import "cplay.h"

@implementation cplay

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.chapter = chapter;
    [self next:NO];
    
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

#pragma mark functionality

-(void)next:(BOOL)animated
{
    mchallenge *challenge = [self.chapter challenge];
    [self setViewControllers:@[[[cplayitem alloc] init:self challenge:challenge]] direction:UIPageViewControllerNavigationDirectionForward animated:animated completion:nil];
}

#pragma mark public

-(void)playnext
{
    if([self.chapter keepplaying])
    {
        [self next:YES];
    }
    else
    {
        
    }
}

@end