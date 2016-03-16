#import "scoursesubs1.h"

@implementation scoursesubs1

-(instancetype)init
{
    self = [super init];
    
    self.operations = @[
                        [[moperationadd alloc] init]
                        ];
    
    return self;
}

@end