#import "appdel.h"

@class cplayitem;

@interface vplayitemcontrols:UIView

-(instancetype)init:(cplayitem*)controller;

@property(weak, nonatomic)cplayitem *controller;
@property(weak, nonatomic)UIView *basefield;

@end