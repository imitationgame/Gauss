#import "appdel.h"

@class mstatsm;

@interface vstatsinfo:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mstatsm *model;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)UILabel *labelempty;
@property(weak, nonatomic)UILabel *labeltitle;
@property(nonatomic)NSUInteger collectionheight;

@end