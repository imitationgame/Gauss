#import "appdel.h"

@class cplayfinish;

@interface vplayfinishbar:UIView

-(instancetype)init:(cplayfinish*)controller;

@property(weak, nonatomic)cplayfinish *controller;

@end