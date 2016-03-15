#import "mstatsm.h"

static NSUInteger const maxitems = 5;

@implementation mstatsm

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(void)refresh
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       self.items = [NSMutableArray array];
                       NSUInteger totalcourses = [mcourse singleton].courses.count;
                       
                       for(NSUInteger i = 0; i < totalcourses; i++)
                       {
                           mcourseitem *course = [mcourse singleton].courses[i];
                           NSUInteger totalchapters = course.chapters.count;
                           
                           for(NSUInteger j = 0; j < totalchapters; j++)
                           {
                               mcourseitemchapter *chapter = course.chapters[j];
                               
                               if(chapter.timestmap)
                               {
                                   mstatsitem *item = [[mstatsitem alloc] init:chapter];
                                   [self.items addObject:item];
                               }
                           }
                       }
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notstatsready object:nil];
                   });
}

@end