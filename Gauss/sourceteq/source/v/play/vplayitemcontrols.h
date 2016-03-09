#import "appdel.h"

@class cplayitem;

@interface vplayitemcontrols:UIView<UITextFieldDelegate>

-(instancetype)init:(cplayitem*)controller;
-(void)start;
-(void)deactivate;
-(void)reactivate;

@property(weak, nonatomic)cplayitem *controller;
@property(weak, nonatomic)UITextField *field;
@property(weak, nonatomic)UIButton *buttonnext;
@property(weak, nonatomic)UIView *basefield;
@property(nonatomic)BOOL active;

@end