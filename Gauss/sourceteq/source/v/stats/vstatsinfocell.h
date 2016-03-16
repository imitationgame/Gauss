#import "appdel.h"

@class mstatsitem;

@interface vstatsinfocell:UICollectionViewCell

-(void)config:(mstatsitem*)model;

@property(weak, nonatomic)NSLayoutConstraint *layoutbarheight;

@end