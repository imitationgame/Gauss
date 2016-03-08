#import "appdel.h"

@class mchallenge;

@interface mplayitem:NSObject

-(instancetype)init:(mchallenge*)challenge;

@property(weak, nonatomic)mchallenge *challenge;
@property(strong, nonatomic)NSMutableArray *cells;

@end