#import "appdel.h"

@class cplay;

@interface cplayfinish:UIViewController

-(instancetype)init:(cplay*)play;

@property(weak, nonatomic)cplay *play;

@end