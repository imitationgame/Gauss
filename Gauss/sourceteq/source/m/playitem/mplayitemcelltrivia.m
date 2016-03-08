#import "mplayitemcelltrivia.h"

@interface mplayitemcelltrivia ()

@property(weak, nonatomic)mchallengeoperand *model;

@end

@implementation mplayitemcelltrivia

@dynamic model;

-(instancetype)init:(mchallengeoperand*)model
{
    self = [super init:model];
    self.cellclass = [vplayitemchallengetrivia class];
    
    return self;
}

@end