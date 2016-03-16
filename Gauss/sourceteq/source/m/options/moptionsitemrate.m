#import "moptionsitemrate.h"

@implementation moptionsitemrate

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"options_item_store_rate", nil);
    
    return self;
}

#pragma mark -
#pragma mark options item

-(void)selected
{
    [[analytics singleton] trackevent:ga_event_review action:ga_action_optin label:nil];
    [tools rateapp];
}

@end