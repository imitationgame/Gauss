#import "scoursemult5.h"

@implementation scoursemult5

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -50;
    self.maxnumber = 50;
    self.maxoperands = 3;
    self.timeout = 20;
    self.operations = @[
                        [[moperationmult alloc] init]
                        ];
    
    return self;
}

@end