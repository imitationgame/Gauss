#import "scoursesubs5.h"

@implementation scoursesubs5

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -50;
    self.maxnumber = 50;
    self.maxoperands = 3;
    self.timeout = 12;
    self.operations = @[
                        [[moperationadd alloc] init],
                        [[moperationsubs alloc] init]
                        ];
    
    return self;
}

@end