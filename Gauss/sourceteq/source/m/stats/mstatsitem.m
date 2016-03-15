#import "mstatsitem.h"

@implementation mstatsitem

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init];
    self.timestamp = chapter.timestmap;
    
    return self;
}

@end