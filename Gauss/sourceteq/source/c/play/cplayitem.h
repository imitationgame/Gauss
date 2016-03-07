#import "appdel.h"

@class cplay;
@class mchallenge;

@interface cplayitem:UIViewController<UIAlertViewDelegate>

-(instancetype)init:(cplay*)play challenge:(mchallenge*)challenge;
-(void)back;

@property(weak, nonatomic)cplay *play;
@property(weak, nonatomic)mchallenge *challenge;

@end