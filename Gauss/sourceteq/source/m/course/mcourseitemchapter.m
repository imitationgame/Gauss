#import "mcourseitemchapter.h"

@implementation mcourseitemchapter

-(instancetype)init:(mcourseitem*)course
{
    self = [super init];
    self.course = course;
    self.uniqueid = NSStringFromClass([self class]);
    self.timestmap = 0;
    self.score = 0;
    self.dbid = 0;
    self.available = NO;
    
    return self;
}

@end