#import "appdel.h"

@class mcontactrate;

@interface vcontactrate:UICollectionViewCell<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mcontactrate *model;
@property(weak, nonatomic)UICollectionView *collection;

@end