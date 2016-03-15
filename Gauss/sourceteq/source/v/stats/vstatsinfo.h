#import "appdel.h"

@class mstatsm;

@interface vstatsinfo:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mstatsm *model;
@property(weak, nonatomic)UICollectionView *collection;
@property(nonatomic)NSUInteger cellwidth;
@property(nonatomic)NSUInteger collectionheight;

@end