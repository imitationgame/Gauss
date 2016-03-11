#import "appdel.h"

@class cstats;

@interface vstatsbar:UIView

-(instancetype)init:(cstats*)controller;

@property(weak, nonatomic)cstats *controller;

@end