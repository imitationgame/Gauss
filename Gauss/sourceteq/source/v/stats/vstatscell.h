#import "appdel.h"

@class mcourseitemchapter;
@class vstatsstatus;

@interface vstatscell:UICollectionViewCell

-(void)config:(NSUInteger)index model:(mcourseitemchapter*)model;

@property(weak, nonatomic)mcourseitemchapter *model;
@property(weak, nonatomic)vstatsstatus *status;
@property(weak, nonatomic)UILabel *labelindex;

@end