#import "scourseadd1.h"

@implementation scourseadd1

-(instancetype)init
{
    self = [super init];
 
    self.maxnumber = 1;
    self.operations = @[
                        [[moperationadd alloc] init]
                        ];
    
    return self;
}

@end