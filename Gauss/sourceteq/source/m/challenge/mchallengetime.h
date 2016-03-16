#import "appdel.h"

@interface mchallengetime:NSObject

-(instancetype)init:(NSUInteger)limit;
-(void)tick;
-(void)start;
-(void)end;

@property(nonatomic)NSUInteger limit;
@property(nonatomic)NSInteger extratime;
@property(nonatomic)NSInteger starting;
@property(nonatomic)NSInteger ending;

@end