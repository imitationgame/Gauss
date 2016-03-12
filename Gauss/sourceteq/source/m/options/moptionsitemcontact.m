#import "moptionsitemcontact.h"

@implementation moptionsitemcontact

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"options_item_store_contact", nil);
    
    return self;
}

#pragma mark -
#pragma mark options item

-(void)selected
{
    [cstore show];
}

@end