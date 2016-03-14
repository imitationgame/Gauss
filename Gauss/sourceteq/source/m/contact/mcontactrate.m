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

@end