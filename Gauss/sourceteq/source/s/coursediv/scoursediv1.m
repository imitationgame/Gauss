#import "scoursediv1.h"

@implementation scoursediv1

-(instancetype)init
{
    self = [super init];
    
    self.timeout = 6;
    self.operations = @[
                        [[moperationmult alloc] init]
                        ];
    
    return self;
}

@end