#import "scoursemult2.h"

@implementation scoursemult2

-(instancetype)init
{
    self = [super init];
    
    self.maxnumber = 20;
    self.timeout = 8;
    self.operations = @[
                        [[moperationmult alloc] init]
                        ];
    
    return self;
}

@end