#import "mplayitemcelloperand.h"

@interface mplayitemcelloperand ()

@property(weak, nonatomic)mchallengeoperand *model;

@end

@implementation mplayitemcelloperand

@dynamic model;

-(instancetype)init:(mchallengeoperand*)model
{
    self = [super init:model];
    self.cellclass = [vplayitemchallengeoperand class];
    
    return self;
}

@end