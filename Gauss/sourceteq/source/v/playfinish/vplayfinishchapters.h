#import "appdel.h"

@class mplayfinishcellchapters;

@interface vplayfinishchapters:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(mplayfinishcellchapters*)model;

@property(weak, nonatomic)mplayfinishcellchapters *model;
@property(weak, nonatomic)UICollectionView *collection;

@end