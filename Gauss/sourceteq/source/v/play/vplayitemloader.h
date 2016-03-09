#import "appdel.h"

@class cplayitem;

@interface vplayitemloader:UIView

-(instancetype)init:(cplayitem*)controller;

@property(weak, nonatomic)cplayitem *controller;
@property(weak, nonatomic)UIButton *buttonstop;

@end