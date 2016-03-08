#import "cplayitem.h"

@interface cplayitem ()

@property(strong, nonatomic)vplayitem *view;

@end

@implementation cplayitem
{
    BOOL firsttime;
}

@dynamic view;

-(instancetype)init:(cplay*)play challenge:(mchallenge*)challenge
{
    self = [super init];

    self.play = play;
    self.challenge = challenge;
    firsttime = YES;
    
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(firsttime)
    {
        firsttime = NO;
        [self.challenge.time start];
        [self.view.controls start];
    }
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
    BOOL pass = NO;
    
    if(answer.length)
    {
        double received = answer.doubleValue;
        double expected = self.challenge.trivia.value;
        
        if(received == expected)
        {
            pass = YES;
        }
        else
        {
            NSLog(@"expted: %@, received: %@", @(expected), @(received));
        }
    }
    
    if(pass)
    {
        NSUInteger score = self.challenge.chapter.index * self.challenge.time.extratime;
        [self.challenge.chapter success:score];
        
        NSLog(@"scored %@", @(score));
    }
    else
    {
        NSLog(@"wrong answer");
    }
    
    self.challenge = nil;
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
        [[cmain singleton].pages sectionstats:UIPageViewControllerNavigationDirectionReverse animated:YES];
    }
}

@end