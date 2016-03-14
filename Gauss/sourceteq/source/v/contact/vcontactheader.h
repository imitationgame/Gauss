#import "appdel.h"

@class ccontact;

@interface vcontactheader:UIView

-(instancetype)init:(ccontact*)controller;

@property(weak, nonatomic)ccontact *controller;

@end