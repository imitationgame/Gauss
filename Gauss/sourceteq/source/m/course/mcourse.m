#import "mcourse.h"

@implementation mcourse
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];
    
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