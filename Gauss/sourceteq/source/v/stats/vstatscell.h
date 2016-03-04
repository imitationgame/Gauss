#import "appdel.h"

@class cstats;
@class mcourseitemchapter;
@class vstatsstatus;

@interface vstatscell:UICollectionViewCell

-(void)config:(NSUInteger)index model:(mcourseitemchapter*)model controller:(cstats*)controller;

@property(weak, nonatomic)cstats *controller;
@property(weak, nonatomic)mcourseitemchapter *model;
@property(weak, nonatomic)vstatsstatus *status;
@property(weak, nonatomic)UIButton *buttonplay;
@property(weak, nonatomic)UILabel *labelindex;
@property(weak, nonatomic)UILabel *labelnotice;

@end