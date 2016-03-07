#import "appdel.h"

@interface mchallengetime:NSObject

-(instancetype)init:(NSUInteger)limit;

@property(nonatomic)NSUInteger limit;
@property(nonatomic)NSUInteger starting;
@property(nonatomic)NSUInteger ending;

@end