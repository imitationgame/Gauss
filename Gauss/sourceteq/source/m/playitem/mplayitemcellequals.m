#import "mplayitemcellequals.h"

static NSUInteger const equalswidth = 25;

@implementation mplayitemcellequals

-(instancetype)init
{
    self = [super init:nil];
    self.cellclass = [vplayitemchallengeequals class];
    self.width = equalswidth;
    
    return self;
}

#pragma mark -
#pragma mark item cell

-(void)configure:(vplayitemchallengeequals*)cell
{
}

@end