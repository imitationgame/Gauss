#import "appdel.h"

@class vstatsstatus;
@class mcourseitem;

@interface vstatsheader:UICollectionReusableView

-(void)config:(mcourseitem*)model;

@property(weak, nonatomic)vstatsstatus *status;
@property(weak, nonatomic)UILabel *label;

@end