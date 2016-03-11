#import "appdel.h"

@class mstorepurchasesitem;

@interface vstorecell:UICollectionViewCell

-(void)config:(mstorepurchasesitem*)item;

@property(weak, nonatomic)mstorepurchasesitem *item;
@property(weak, nonatomic)NSLayoutConstraint *layoutlabelheight;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UILabel *statuslabel;
@property(weak, nonatomic)UILabel *statusicon;
@property(weak, nonatomic)UIButton *button;

@end