#import "appdel.h"

@class mcourseitemchapter;

@interface vstatscell:UICollectionViewCell

-(void)config:(NSUInteger)index model:(mcourseitemchapter*)model;

@property(weak, nonatomic)mcourseitemchapter *model;

@end