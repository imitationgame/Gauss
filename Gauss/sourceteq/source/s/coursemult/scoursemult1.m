#import "scoursemult1.h"

@implementation scoursemult1

-(instancetype)init
{
    self = [super init];
    
    self.timeout = 7;
    self.operations = @[
                        [[moperationmult alloc] init]
                        ];
    
    return self;
}

@end