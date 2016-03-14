#import "mcontactitememail.h"

@implementation mcontactitememail

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vcontactemail class];
    self.cellheight = 120;
    
    return self;
}

@end