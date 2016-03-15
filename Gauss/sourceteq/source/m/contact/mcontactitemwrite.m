#import "mcontactitemwrite.h"

@implementation mcontactitemwrite

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vcontactwrite class];
    self.cellheight = 680;
    
    return self;
}

@end