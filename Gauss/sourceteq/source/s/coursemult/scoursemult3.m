#import "scoursemult3.h"

@implementation scoursemult3

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -5;
    self.maxnumber = 20;
    self.timeout = 9;
    self.operations = @[
                        [[moperationmult alloc] init]
                        ];
    
    return self;
}

@end