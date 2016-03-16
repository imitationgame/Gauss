#import "scourseadd3.h"

@implementation scourseadd3

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -5;
    self.maxnumber = 20;
    self.timeout = 7;
    self.operations = @[
                        [[moperationadd alloc] init]
                        ];
    
    return self;
}

@end