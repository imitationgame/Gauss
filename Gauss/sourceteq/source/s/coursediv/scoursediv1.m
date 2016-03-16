#import "scoursediv1.h"

@implementation scoursediv1

-(instancetype)init
{
    self = [super init];
    
    self.timeout = 8;
    self.operations = @[
                        [[moperationdiv alloc] init]
                        ];
    
    return self;
}

@end