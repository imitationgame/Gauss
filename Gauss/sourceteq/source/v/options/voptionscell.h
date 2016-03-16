#import "appdel.h"

@class moptionsitem;

@interface voptionscell:UICollectionViewCell

-(void)config:(moptionsitem*)model;

@property(weak, nonatomic)UILabel *label;

@end