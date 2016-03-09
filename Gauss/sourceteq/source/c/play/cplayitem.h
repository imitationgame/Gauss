#import "appdel.h"

@class timerbg;
@class cplay;
@class mchallenge;

@interface cplayitem:UIViewController<UIAlertViewDelegate, timerbgdel>

-(instancetype)init:(cplay*)play challenge:(mchallenge*)challenge;
-(void)start;
-(void)submit;
-(void)back;

@property(weak, nonatomic)cplay *play;
@property(strong, nonatomic)mchallenge *challenge;
@property(strong, nonatomic)timerbg *timer;

@end