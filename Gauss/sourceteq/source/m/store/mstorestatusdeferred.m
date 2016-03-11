#import "mstorestatusdeferred.h"

@implementation mstorestatusdeferred

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"purchase_status_deferred", nil);
    
    return self;
}

@end