#import "mplayitemcellresult.h"

@interface mplayitemcellresult ()

@property(weak, nonatomic)mchallengeoperand *model;

@end

@implementation mplayitemcellresult

@dynamic model;

-(instancetype)init:(mchallengeoperand*)model
{
    self = [super init:model];
    self.cellclass = [UICollectionViewCell class];
    
    return self;
}

@end