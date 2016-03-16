#import "appdel.h"

@class mplayfinishcellpoints;

@interface vplayfinishpoints:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(mplayfinishcellpoints*)model;

@property(weak, nonatomic)mplayfinishcellpoints *model;
@property(weak, nonatomic)UICollectionView *collection;

@end