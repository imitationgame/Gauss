#import "mcourseitemchapter.h"

@implementation mcourseitemchapter

-(instancetype)init
{
    self = [super init];
    self.uniqueid = NSStringFromClass([self class]);
    self.timestmap = 0;
    self.score = 0;
    
    return self;
}

@end