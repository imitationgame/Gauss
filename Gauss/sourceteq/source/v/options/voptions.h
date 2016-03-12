#import "appdel.h"
#import "viewbase.h"

@class moptions;

@interface voptions:viewbase<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property(strong, nonatomic)moptions *model;
@property(weak, nonatomic)UICollectionView *collection;

@end