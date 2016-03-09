#import "appdel.h"

@class timerbg;

@interface mchallengetime:NSObject<timerbgdel>

-(instancetype)init:(NSUInteger)limit;

@property(strong, nonatomic)timerbg *timer;
@property(nonatomic)NSUInteger limit;
@property(nonatomic)NSInteger extratime;

@end