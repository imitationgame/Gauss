#import "scoursediv5.h"

@implementation scoursediv5

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -50;
    self.maxnumber = 50;
    self.maxoperands = 3;
    self.timeout = 29;
    self.operations = @[
                        [[moperationdiv alloc] init]
                        ];
    
    return self;
}

@end