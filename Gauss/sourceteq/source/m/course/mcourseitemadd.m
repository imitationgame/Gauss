#import "mcourseitemadd.h"

@implementation mcourseitemadd

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"course_add_name", nil);
    self.chapters = @[
                      [[mcourseadd1 alloc] init:self],
                      [[mcourseadd2 alloc] init:self]
                      ];
    
    return self;
}

@end