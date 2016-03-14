#import "mcontact.h"

@implementation mcontact

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[mcontactitememail alloc] init],
                   [[mcontactitemwrite alloc] init]
                   ];
    
    return self;
}

@end