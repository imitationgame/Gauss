#import "mcourseitemsubs.h"

@implementation mcourseitemsubs

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"course_subs_name", nil);
    self.chapters = @[
                      [[mcoursesubs1 alloc] init:self],
                      [[mcoursesubs2 alloc] init:self]
                      ];
    
    return self;
}

@end