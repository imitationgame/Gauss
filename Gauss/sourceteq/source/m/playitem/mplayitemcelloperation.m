#import "mplayitemcelloperation.h"

@interface mplayitemcelloperation ()

@property(weak, nonatomic)moperation *model;

@end

@implementation mplayitemcelloperation

@dynamic model;

-(instancetype)init:(moperation*)model
{
    self = [super init:model];
    self.cellclass = [UICollectionViewCell class];
    
    return self;
}

@end