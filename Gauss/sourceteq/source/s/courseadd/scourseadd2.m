#import "scourseadd2.h"

@implementation scourseadd2

-(instancetype)init
{
    self = [super init];
    
    self.maxnumber = 20;
    self.timeout = 6;
    self.operations = @[
                        [[moperationadd alloc] init]
                        ];
    
    return self;
}

@end