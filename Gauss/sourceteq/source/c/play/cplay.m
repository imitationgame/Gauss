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
    cplayitem *controller = [[cplayitem alloc] init:self challenge:challenge];
    
    [self setViewControllers:@[controller] direction:UIPageViewControllerNavigationDirectionForward animated:animated completion:nil];
}

-(void)finish
{
    cplayfinish *controller = [[cplayfinish alloc] init:self];
    
    [self setViewControllers:@[controller] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
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
        [self finish];
    }
}

@end