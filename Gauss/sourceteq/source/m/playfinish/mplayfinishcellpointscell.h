#import <UIKit/UIKit.h>

@interface mplayfinishcellpointscell:NSObject

-(instancetype)init:(CGFloat)percent;

@property(copy, nonatomic)NSString *name;
@property(nonatomic)CGFloat percent;

@end