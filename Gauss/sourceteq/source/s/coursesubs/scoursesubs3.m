#import "scoursesubs3.h"

@implementation scoursesubs3

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -5;
    self.maxnumber = 20;
    self.timeout = 7;
    self.operations = @[
                        [[moperationadd alloc] init],
                        [[moperationsubs alloc] init],
                        ];
    
    return self;
}

@end