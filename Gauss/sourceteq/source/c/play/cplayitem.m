#import "cplayitem.h"

@interface cplayitem ()

@property(strong, nonatomic)vplayitem *view;

@end

@implementation cplayitem

@dynamic view;

-(instancetype)init:(cplay*)play challenge:(mchallenge*)challenge
{
    self = [super init];

    self.play = play;
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

#pragma mark functionality

-(void)answer:(NSString*)answer
{
    double received = answer.doubleValue;
    double expected = self.challenge.trivia.value;
    
    if(received == expected)
    {
        NSUInteger score = self.challenge.chapter.index * self.challenge.time.extratime;
        [self.challenge.chapter success:score];
        
        NSLog(@"scored %@", @(score));
    }
    else
    {
        NSLog(@"expted: %@, received: %@", @(expected), @(received));
    }
    
    self.challenge = nil;
}

#pragma mark public

-(void)start
{
    [self.view.loader removeFromSuperview];
    [self.view.controls start];
    [self.view start];
}

-(void)back
{
    NSString *alerttitle = NSLocalizedString(@"play_back_alert_title", nil);
    NSString *alertmessage = NSLocalizedString(@"play_back_alert_message", nil);
    NSString *alertcancel = NSLocalizedString(@"play_back_alert_cancel", nil);
    NSString *alertaccept = NSLocalizedString(@"play_back_alert_accept", nil);
    
    [[[UIAlertView alloc] initWithTitle:alerttitle message:alertmessage delegate:self cancelButtonTitle:alertcancel otherButtonTitles:alertaccept, nil] show];
}

-(void)submit:(NSString*)answer
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [self answer:answer];
                   });
    
    [self.play playnext];
}

#pragma mark -
#pragma mark alert del

-(void)alertView:(UIAlertView*)alert clickedButtonAtIndex:(NSInteger)index
{
    if(index)
    {
        [[UIApplication sharedApplication].keyWindow endEditing:YES];
        [[cmain singleton].pages sectionstats:UIPageViewControllerNavigationDirectionReverse animated:YES];
    }
    else
    {
        [self.view.controls reactivate];
    }
}

@end