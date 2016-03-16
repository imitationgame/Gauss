#import "scoursediv3.h"

@implementation scoursediv3

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -5;
    self.maxnumber = 20;
    self.timeout = 11;
    self.operations = @[
                        [[moperationdiv alloc] init]
                        ];
    
    return self;
}

@end