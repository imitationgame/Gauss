#import "scoursediv6.h"

@implementation scoursediv6

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -50;
    self.maxnumber = 50;
    self.maxoperands = 3;
    self.timeout = 42;
    self.decimals = YES;
    self.operations = @[
                        [[moperationdiv alloc] init]
                        ];
    
    return self;
}

@end