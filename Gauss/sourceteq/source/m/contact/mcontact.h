#import "appdel.h"

@class mcontactitem;

@interface mcontact:NSObject

-(void)registercollection:(UICollectionView*)collection;

@property(strong, nonatomic)NSArray<mcontactitem*> *items;

@end