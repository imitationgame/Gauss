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
            
            break;
        }
    }
}

+(void)openchapter:(mcourseitemchapter*)chapter
{
    
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