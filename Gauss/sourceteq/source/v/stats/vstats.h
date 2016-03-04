#import "appdel.h"
#import "viewbase.h"

@class vstatsbar;
@class vstatsinfo;

@interface vstats:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)vstatsbar *bar;
@property(weak, nonatomic)vstatsinfo *info;
@property(weak, nonatomic)UICollectionView *collection;
@property(weak, nonatomic)NSLayoutConstraint *layoutbarheight;
@property(weak, nonatomic)NSLayoutConstraint *layoutinfoheight;

@end