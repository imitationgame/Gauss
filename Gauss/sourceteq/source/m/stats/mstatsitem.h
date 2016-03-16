#import "appdel.h"

@class mcourseitemchapter;

@interface mstatsitem:NSObject

-(instancetype)init:(CGFloat)percent;

@property(nonatomic)CGFloat percent;

@end