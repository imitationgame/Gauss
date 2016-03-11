#import "mstorestatuspurchased.h"

@implementation mstorestatuspurchased

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"purchase_status_purchased", nil);
    
    return self;
}

@end