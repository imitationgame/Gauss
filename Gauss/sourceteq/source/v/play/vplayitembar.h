#import "appdel.h"

@class cplayitem;

@interface vplayitembar:UIView

-(instancetype)init:(cplayitem*)controller;

@property(weak, nonatomic)cplayitem *controller;
@property(weak, nonatomic)UIButton *buttonback;

@end