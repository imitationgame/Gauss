#import "appdel.h"

@class cplay;
@class mchallenge;

@interface cplayitem:UIViewController

-(instancetype)init:(cplay*)play challenge:(mchallenge*)challenge;

@property(weak, nonatomic)cplay *play;
@property(weak, nonatomic)mchallenge *challenge;

@end