#import "appdel.h"

@class mcourseitemchapter;
@class vstatsstatus;

@interface vstatscell:UICollectionViewCell

-(void)config:(mcourseitemchapter*)model;

@property(weak, nonatomic)vstatsstatus *status;
@property(weak, nonatomic)UILabel *labelindex;
@property(weak, nonatomic)UILabel *labelnotice;

@end