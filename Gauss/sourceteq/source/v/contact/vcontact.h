#import "appdel.h"
#import "viewbase.h"

@interface vcontact:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)NSLayoutConstraint *layoutheaderheight;
@property(weak, nonatomic)UICollectionView *collection;

@end