#import "appdel.h"

@class cplayitem;
@class mplayitem;

@interface vplayitemchallenge:UIView<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

-(instancetype)init:(cplayitem*)controller;

@property(strong, nonatomic)mplayitem *model;
@property(weak, nonatomic)cplayitem *controller;
@property(weak, nonatomic)UICollectionView *collection;

@end