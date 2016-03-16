#import "scourseadd5.h"

@implementation scourseadd5

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -50;
    self.maxnumber = 50;
    self.maxoperands = 3;
    self.timeout = 12;
    self.operations = @[
                        [[moperationadd alloc] init]
                        ];
    
    return self;
}

@end