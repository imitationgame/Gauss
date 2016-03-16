#import "scoursesubs2.h"

@implementation scoursesubs2

-(instancetype)init
{
    self = [super init];
    
    self.maxnumber = 20;
    self.timeout = 6;
    self.operations = @[
                        [[moperationsubs alloc] init],
                        ];
    
    return self;
}

@end