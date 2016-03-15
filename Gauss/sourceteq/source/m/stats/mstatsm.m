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
                       NSMutableArray *rawitems = [NSMutableArray array];
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
                                   [rawitems addObject:item];
                               }
                           }
                       }
                       
                       self.items = [rawitems sortedArrayUsingComparator:
                                     ^NSComparisonResult(mstatsitem* _Nonnull item1, mstatsitem* _Nonnull item2)
                       {
                           NSComparisonResult result = NSOrderedSame;
                           
                           if(item1.timestamp > item2.timestamp)
                           {
                               result = NSOrderedAscending;
                           }
                           else if(item2.timestamp > item1.timestamp)
                           {
                               result = NSOrderedDescending;
                           }
                           
                           return result;
                       }];
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notstatsready object:nil];
                   });
}

@end