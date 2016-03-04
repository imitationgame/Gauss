#import "mcourseitemadd.h"

@implementation mcourseitemadd

-(instancetype)init
{
    self = [super init];
    
    self.name = NSLocalizedString(@"course_add_name", nil);
    self.chapters = @[
                      [[mcourseadd1 alloc] init],
                      [[mcourseadd2 alloc] init]
                      ];
    
    return self;
}

@end