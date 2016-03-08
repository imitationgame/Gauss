#import "appdel.h"

@class cplayitem;

@interface vplayitemcontrols:UIView<UITextFieldDelegate>

-(instancetype)init:(cplayitem*)controller;

@property(weak, nonatomic)cplayitem *controller;
@property(weak, nonatomic)UITextField *field;
@property(weak, nonatomic)UIButton *buttonnext;
@property(weak, nonatomic)UIView *basefield;

@end