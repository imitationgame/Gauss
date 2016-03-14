#import "mcontactrate.h"

static NSUInteger const starsnum = 5;

@implementation mcontactrate

-(instancetype)init
{
    self = [super init];
    self.stars = [NSMutableArray array];
    
    for(NSUInteger i = 0; i < starsnum; i++)
    {
        mcontactrateitem *star = [[mcontactrateitem alloc] init];
        star.selected = NO;
        [self.stars addObject:star];
    }
    
    return self;
}

#pragma mark public

-(void)selectstar:(NSUInteger)index
{
    for(NSUInteger i = 0; i < starsnum; i++)
    {
        mcontactrateitem *star = self.stars[i];
        star.selected = i <= index;
    }
}

@end