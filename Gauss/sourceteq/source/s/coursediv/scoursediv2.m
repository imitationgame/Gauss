#import "scoursediv2.h"

@implementation scoursediv2

-(instancetype)init
{
    self = [super init];
    
    self.maxnumber = 20;
    self.timeout = 12;
    self.operations = @[
                        [[moperationdiv alloc] init]
                        ];
    
    return self;
}

@end