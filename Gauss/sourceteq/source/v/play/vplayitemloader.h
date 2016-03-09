#import "appdel.h"

@class cplayitem;
@class vclock;

@interface vplayitemloader:UIView

-(instancetype)init:(cplayitem*)controller;

@property(weak, nonatomic)cplayitem *controller;
@property(weak, nonatomic)vclock *clock;
@property(weak, nonatomic)NSLayoutConstraint *layoutclockleft;
@property(weak, nonatomic)UIButton *buttonstop;

@end