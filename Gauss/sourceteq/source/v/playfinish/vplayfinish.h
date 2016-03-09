#import "appdel.h"
#import "viewbase.h"

@class mplayfinish;

@interface vplayfinish:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)mplayfinish *model;
@property(weak, nonatomic)UICollectionView *collection;

@end