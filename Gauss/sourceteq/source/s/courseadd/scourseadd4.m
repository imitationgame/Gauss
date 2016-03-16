#import "scourseadd4.h"

@implementation scourseadd4

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -20;
    self.maxnumber = 20;
    self.maxoperands = 3;
    self.timeout = 14;
    self.operations = @[
                        [[moperationadd alloc] init]
                        ];
    
    return self;
}

@end