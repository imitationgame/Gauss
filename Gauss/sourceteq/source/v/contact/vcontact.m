#import "vcontact.h"

@interface vcontact ()

@property(weak, nonatomic)ccontact *controller;

@end

@implementation vcontact

@dynamic controller;

-(instancetype)init:(ccontact*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    UICollectionViewCell *cell;
    
    return cell;
}

@end