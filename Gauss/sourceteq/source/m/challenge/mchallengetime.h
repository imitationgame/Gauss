#import "appdel.h"

@interface mchallengetime:NSObject

-(instancetype)init:(NSUInteger)limit;
-(void)start;
-(NSInteger)tick;
-(void)end;

@property(nonatomic)NSUInteger limit;
@property(nonatomic)NSUInteger starting;
@property(nonatomic)NSUInteger ending;
@property(nonatomic)NSUInteger extratime;

@end