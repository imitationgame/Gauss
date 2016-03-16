#import "mcourseitemadd.h"

@implementation mcourseitemadd

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"course_add_name", nil);
    
    [self add:[[mcourseadd1 alloc] init]];
    [self add:[[mcourseadd2 alloc] init]];
    [self add:[[mcourseadd3 alloc] init]];
    [self add:[[mcourseadd4 alloc] init]];
    [self add:[[mcourseadd5 alloc] init]];
    [self add:[[mcourseadd6 alloc] init]];
    
    return self;
}

@end