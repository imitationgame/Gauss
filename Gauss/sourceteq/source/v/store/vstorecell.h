#import "appdel.h"

@class mstorepurchasesitem;

@interface vstorecell:UICollectionViewCell

-(void)config:(mstorepurchasesitem*)item;

@property(weak, nonatomic)mstorepurchasesitem *item;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UILabel *status;
@property(weak, nonatomic)UIButton *button;

@end