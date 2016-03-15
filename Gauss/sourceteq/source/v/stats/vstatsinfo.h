#import "appdel.h"

@interface vstatsinfo:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)UICollectionView *collection;
@property(nonatomic)NSUInteger collectionheight;

@end