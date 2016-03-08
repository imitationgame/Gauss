#import "mcourseitem.h"
#import "mdb.h"

@implementation mcourseitem

-(instancetype)init
{
    self = [super init];
    self.uniqueid = NSStringFromClass([self class]);
    self.chapters = [NSMutableArray array];
    self.dbid = 0;
    self.available = NO;
    
    return self;
}

#pragma mark public

-(void)open
{
    self.available = YES;
    [mdb opencourse:self.dbid];
}

-(void)add:(mcourseitemchapter*)chapter
{
    NSUInteger index = self.chapters.count + 1;
    chapter.course = self;
    chapter.index = index;
    [self.chapters addObject:chapter];
}

@end