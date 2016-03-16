#import "scoursediv4.h"

@implementation scoursediv4

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -25;
    self.maxnumber = 25;
    self.maxoperands = 3;
    self.timeout = 23;
    self.operations = @[
                        [[moperationdiv alloc] init]
                        ];
    
    return self;
}

@end