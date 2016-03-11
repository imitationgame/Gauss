#import "appdel.h"

@class coptions;

@interface voptionsbar:UIView

-(instancetype)init:(coptions*)controller;

@property(weak, nonatomic)coptions *controller;

@end