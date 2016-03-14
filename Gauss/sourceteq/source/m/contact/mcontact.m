#import "mcontact.h"

@implementation mcontact

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[mcontactitememail alloc] init],
                   [[mcontactitemwrite alloc] init]
                   ];
    
    return self;
}

#pragma mark public

-(void)registercollection:(UICollectionView*)collection
{
    for(mcontactitem *item in self.items)
    {
        [collection registerClass:item.cellclass forCellWithReuseIdentifier:item.reusableid];
    }
}

@end