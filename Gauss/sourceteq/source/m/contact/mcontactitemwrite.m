#import "mcontactitemwrite.h"

@implementation mcontactitemwrite

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vcontactwrite class];
    self.cellheight = 600;
    
    return self;
}

@end