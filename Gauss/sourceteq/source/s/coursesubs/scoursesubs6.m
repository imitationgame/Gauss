#import "scoursesubs6.h"

@implementation scoursesubs6

-(instancetype)init
{
    self = [super init];
    
    self.minnumber = -50;
    self.maxnumber = 50;
    self.maxoperands = 3;
    self.timeout = 20;
    self.decimals = YES;
    self.operations = @[
                        [[moperationadd alloc] init],
                        [[moperationsubs alloc] init]
                        ];
    
    return self;
}

@end