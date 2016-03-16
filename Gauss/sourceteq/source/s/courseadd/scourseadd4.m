#import "scourseadd4.h"

@implementation scourseadd4

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -25;
    self.maxnumber = 25;
    self.maxoperands = 3;
    self.timeout = 10;
    self.operations = @[
                        [[moperationadd alloc] init]
                        ];
    
    return self;
}

@end