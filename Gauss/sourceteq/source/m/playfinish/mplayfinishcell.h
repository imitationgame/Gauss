#import <UIKit/UIKit.h>

@class mcourseitemchapter;
@class vplayfinishcell;

@interface mplayfinishcell:NSObject

-(instancetype)init:(mcourseitemchapter*)chapter;
-(void)configure:(vplayfinishcell*)cell;

@property(weak, nonatomic)mcourseitemchapter *chapter;
@property(nonatomic)NSInteger cellheight;

@end