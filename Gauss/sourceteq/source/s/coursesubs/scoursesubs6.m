#import "scoursesubs6.h"

@implementation scoursesubs6

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -100;
    self.maxnumber = 100;
    self.maxoperands = 5;
    self.timeout = 22;
    self.operations = @[
                        [[moperationadd alloc] init],
                        [[moperationsubs alloc] init]
                        ];
    
    return self;
}

@end