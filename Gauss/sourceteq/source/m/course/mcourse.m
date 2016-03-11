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
            if(!incourse.available)
            {
                [incourse open];
                mcourseitemchapter *firstchapter = incourse.chapters[0];
                [firstchapter open];
            }
            
            break;
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notcoursesloaded object:nil];
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