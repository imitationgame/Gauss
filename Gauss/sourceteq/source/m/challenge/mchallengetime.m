#import "mchallengetime.h"

@implementation mchallengetime

-(instancetype)init:(NSUInteger)limit
{
    self = [super init];
    self.limit = limit;
    self.extratime = limit;
    
    return self;
}

#pragma mark public

-(void)start
{
    self.starting = [NSDate date].timeIntervalSince1970;
}

-(void)end
{
    self.ending = [NSDate date].timeIntervalSince1970;
}

-(void)tick
{
    NSInteger current = [NSDate date].timeIntervalSince1970;
    NSInteger elapsed = current - self.starting;
    self.extratime = self.limit - elapsed;
}

@end