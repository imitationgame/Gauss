#import "mcourseitemsubs.h"

@implementation mcourseitemsubs

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"course_subs_name", nil);
    
    [self add:[[mcoursesubs1 alloc] init]];
    [self add:[[mcoursesubs2 alloc] init]];
    
    return self;
}

@end