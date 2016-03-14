#import "mcontactitemrate.h"

@implementation mcontactitemrate

-(instancetype)init
{
    self = [super init];
    self.cellclass = [vcontactrate class];
    self.cellheight = 250;
    
    return self;
}

@end