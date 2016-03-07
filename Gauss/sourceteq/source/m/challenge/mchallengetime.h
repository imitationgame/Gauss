#import "appdel.h"

@interface mchallengetime:NSObject

-(instancetype)init:(NSUInteger)limit;
-(void)start;
-(NSInteger)tick;
-(NSUInteger)end;

@property(nonatomic)NSUInteger limit;
@property(nonatomic)NSUInteger starting;
@property(nonatomic)NSUInteger ending;

@end