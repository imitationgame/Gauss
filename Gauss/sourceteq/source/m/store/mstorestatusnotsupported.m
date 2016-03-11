#import "mstorestatusnotsupported.h"

@implementation mstorestatusnotsupported

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"purchase_status_notsupported", nil);
    
    return self;
}

@end