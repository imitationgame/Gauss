#import "appdel.h"
#import "viewbase.h"

@class vcontactheader;

@interface vcontact:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(weak, nonatomic)vcontactheader *header;
@property(weak, nonatomic)NSLayoutConstraint *layoutheaderheight;
@property(weak, nonatomic)NSLayoutConstraint *layoutheadertop;
@property(weak, nonatomic)UICollectionView *collection;

@end