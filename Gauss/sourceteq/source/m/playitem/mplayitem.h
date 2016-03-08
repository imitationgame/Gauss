#import "appdel.h"

@class mchallenge;
@class mplayitemcell;

@interface mplayitem:NSObject

-(instancetype)init:(mchallenge*)challenge;
-(void)registercollection:(UICollectionView*)collection;

@property(weak, nonatomic)mchallenge *challenge;
@property(strong, nonatomic)NSMutableArray<mplayitemcell*> *cells;

@end