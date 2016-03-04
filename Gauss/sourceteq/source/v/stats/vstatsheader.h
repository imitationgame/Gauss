#import "appdel.h"

@class mcourseitem;

@interface vstatsheader:UICollectionReusableView

-(void)config:(mcourseitem*)model;

@property(weak, nonatomic)UIImageView *icon;
@property(weak, nonatomic)UILabel *label;

@end