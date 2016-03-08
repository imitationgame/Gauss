#import "appdel.h"

@class cplay;
@class mchallenge;

@interface cplayitem:UIViewController<UIAlertViewDelegate>

-(instancetype)init:(cplay*)play challenge:(mchallenge*)challenge;
-(void)submit:(NSString*)answer;
-(void)back;

@property(weak, nonatomic)cplay *play;
@property(strong, nonatomic)mchallenge *challenge;

@end