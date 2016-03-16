#import "scourseadd5.h"

@implementation scourseadd5

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -50;
    self.maxnumber = 50;
    self.maxoperands = 4;
    self.timeout = 18;
    self.operations = @[
                        [[moperationadd alloc] init]
                        ];
    
    return self;
}

@end