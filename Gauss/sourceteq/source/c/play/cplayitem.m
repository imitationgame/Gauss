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

#pragma mark public

-(void)back
{
    NSString *alerttitle = NSLocalizedString(@"play_back_alert_title", nil);
    NSString *alertmessage = NSLocalizedString(@"play_back_alert_message", nil);
    NSString *alertcancel = NSLocalizedString(@"play_back_alert_cancel", nil);
    NSString *alertaccept = NSLocalizedString(@"play_back_alert_accept", nil);
    
    [[[UIAlertView alloc] initWithTitle:alerttitle message:alertmessage delegate:self cancelButtonTitle:alertcancel otherButtonTitles:alertaccept, nil] show];
}

#pragma mark -
#pragma mark alert del

-(void)alertView:(UIAlertView*)alert clickedButtonAtIndex:(NSInteger)index
{
    if(index)
    {
        [[cmain singleton].pages sectionstats:UIPageViewControllerNavigationDirectionReverse animated:YES];
    }
}

@end