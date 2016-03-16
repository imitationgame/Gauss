#import "scoursemult6.h"

@implementation scoursemult6

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -50;
    self.maxnumber = 50;
    self.maxoperands = 3;
    self.timeout = 32;
    self.decimals = YES;
    self.operations = @[
                        [[moperationmult alloc] init]
                        ];
    
    return self;
}

@end