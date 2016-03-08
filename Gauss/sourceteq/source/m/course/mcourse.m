#import "mcourse.h"

@implementation mcourse

+(void)opencourse:(Class)courseclass
{
    NSUInteger count = [mcourse singleton].courses.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mcourseitem *incourse = [mcourse singleton].courses[i];
        
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
    
    self.courses = @[
                     [[mcourseitemadd alloc] init],
                     [[mcourseitemsubs alloc] init]
                     ];
    
    return self;
}

#pragma mark public

-(void)ready
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notcoursesloaded object:nil];
}

@end