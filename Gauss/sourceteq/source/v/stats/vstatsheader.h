#import "appdel.h"

@class mcourseitem;

@interface vstatsheader:UICollectionReusableView

-(void)config:(mcourseitem*)model;

@property(weak, nonatomic)UIButton *buttonstore;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIView *indicator;

@end