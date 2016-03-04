#import "mcourse.h"

@implementation mcourse
{
    NSArray *array;
}

+(void)opencourse:(Class)courseclass
{
    NSUInteger count = [[mcourse singleton] count];
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mcourseitem *incourse = [[mcourse singleton] course:i];
        
        if([incourse isKindOfClass:courseclass])
        {
            [incourse open];
            mcourseitemchapter *firstchapter = incourse.chapters[0];
            [firstchapter open];
            
            break;
        }
    }
}

+(BOOL)opennextchapter:(mcourseitemchapter*)chapter
{
    BOOL hasnext = NO;
    
    NSArray *chapters = chapter.course.chapters;
    NSUInteger count = chapters.count;
    NSUInteger currentindex = [chapters indexOfObject:chapter];
    
    if(currentindex < count - 1)
    {
        mcourseitemchapter *nextchapter = chapters[currentindex + 1];
        [nextchapter open];
        
        hasnext = YES;
    }
        
    return hasnext;
}

+(instancetype)singleton
{
    static mcourse *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];

    self.loaded = NO;
    array = @[
              [[mcourseitemadd alloc] init],
              [[mcourseitemsubs alloc] init]
              ];
    
    return self;
}

#pragma mark public

-(void)ready
{
    self.loaded = YES;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notcoursesloaded object:nil];
}

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(mcourseitem*)course:(NSUInteger)index
{
    mcourseitem *item = array[index];
    
    return item;
}

@end