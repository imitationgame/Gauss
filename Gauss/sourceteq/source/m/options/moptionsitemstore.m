#import "moptionsitemstore.h"

@implementation moptionsitemstore

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"options_item_store_title", nil);
    
    return self;
}

#pragma mark -
#pragma mark options item

-(void)selected
{
    [cstore show];
}

@end