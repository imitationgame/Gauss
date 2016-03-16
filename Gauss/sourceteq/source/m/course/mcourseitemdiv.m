#import "mcourseitemdiv.h"

@implementation mcourseitemdiv

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"course_div_name", nil);
    
    [self add:[[mcoursediv1 alloc] init]];
    [self add:[[mcoursediv2 alloc] init]];
    [self add:[[mcoursediv3 alloc] init]];
    [self add:[[mcoursediv4 alloc] init]];
    [self add:[[mcoursediv5 alloc] init]];
    [self add:[[mcoursediv6 alloc] init]];
    
    return self;
}

@end