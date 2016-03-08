#import "mcourseitemadd.h"

@implementation mcourseitemadd

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"course_add_name", nil);
    
    [self add:[[mcourseadd1 alloc] init]];
    [self add:[[mcourseadd2 alloc] init]];
    
    return self;
}

@end