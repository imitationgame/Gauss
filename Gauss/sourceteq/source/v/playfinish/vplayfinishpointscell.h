#import "appdel.h"

@class mplayfinishcellpointscell;

@interface vplayfinishpointscell:UICollectionViewCell

-(void)config:(mplayfinishcellpointscell*)model;

@property(weak, nonatomic)UILabel *label;

@end