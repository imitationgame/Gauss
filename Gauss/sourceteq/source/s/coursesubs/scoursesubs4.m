#import "scoursesubs4.h"

@implementation scoursesubs4

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -25;
    self.maxnumber = 25;
    self.maxoperands = 3;
    self.timeout = 10;
    self.operations = @[
                        [[moperationsubs alloc] init],
                        ];
    
    return self;
}

@end