#import "scoursemult4.h"

@implementation scoursemult4

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -25;
    self.maxnumber = 25;
    self.maxoperands = 3;
    self.timeout = 14;
    self.operations = @[
                        [[moperationmult alloc] init]
                        ];
    
    return self;
}

@end