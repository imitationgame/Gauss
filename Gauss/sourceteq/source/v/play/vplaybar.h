#import "appdel.h"

@class cplayitem;

@interface vplaybar:UIView

-(instancetype)init:(cplayitem*)controller;

@property(weak, nonatomic)cplayitem *controller;
@property(weak, nonatomic)UIButton *buttonback;

@end