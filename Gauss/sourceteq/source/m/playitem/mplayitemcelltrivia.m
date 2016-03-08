#import "mplayitemcelltrivia.h"

static NSUInteger const triviawidth = 80;

@interface mplayitemcelltrivia ()

@property(weak, nonatomic)mchallengeoperand *model;

@end

@implementation mplayitemcelltrivia

@dynamic model;

-(instancetype)init:(mchallengeoperand*)model
{
    self = [super init:model];
    self.cellclass = [vplayitemchallengetrivia class];
    self.width = triviawidth;
    
    return self;
}

#pragma mark -
#pragma mark item cell

-(void)configure:(vplayitemchallengeoperand*)cell
{
}

@end