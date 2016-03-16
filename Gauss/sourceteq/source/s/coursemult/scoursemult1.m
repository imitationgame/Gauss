#import "scoursemult1.h"

@implementation scoursemult1

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