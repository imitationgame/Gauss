#import "mcontactitememail.h"

@implementation mcontactitememail

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vcontactemail class];
    self.cellheight = 150;
    
    return self;
}

@end