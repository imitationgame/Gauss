#import "appdel.h"

@class cstore;

@interface vstorebar:UIView

-(instancetype)init:(cstore*)controller;

@property(weak, nonatomic)cstore *controller;

@end