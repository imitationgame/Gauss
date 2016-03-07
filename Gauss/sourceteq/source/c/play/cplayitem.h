#import "appdel.h"

@class mchallenge;

@interface cplayitem:UIViewController

-(instancetype)init:(mchallenge*)challenge;

@property(weak, nonatomic)mchallenge *challenge;

@end