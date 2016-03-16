#import "scoursesubs4.h"

@implementation scoursesubs4

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -20;
    self.maxnumber = 20;
    self.maxoperands = 3;
    self.timeout = 14;
    self.operations = @[
                        [[moperationsubs alloc] init],
                        ];
    
    return self;
}

@end