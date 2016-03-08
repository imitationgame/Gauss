#import "mplayitemcellresult.h"

@interface mplayitemcellresult ()

@property(weak, nonatomic)mchallengeoperand *model;

@end

@implementation mplayitemcellresult

@dynamic model;

-(instancetype)init:(mchallengeoperand*)model
{
    self = [super init:model];
    self.cellclass = [vplayitemchallengeresult class];
    
    return self;
}

#pragma mark -
#pragma mark item cell

-(void)configure:(vplayitemchallengeoperand*)cell
{
}

@end