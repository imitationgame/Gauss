#import "appdel.h"

@interface vplaybar:UIView

-(instancetype)init:(cplayitem*)playitem;

@property(weak, nonatomic)cplayitem *playitem;
@property(weak, nonatomic)UIButton *buttonback;

@end