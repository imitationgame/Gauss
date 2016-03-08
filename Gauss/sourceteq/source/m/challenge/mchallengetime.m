#import "mchallengetime.h"

@implementation mchallengetime

-(instancetype)init:(NSUInteger)limit
{
    self = [super init];
    self.limit = limit;
    self.extratime = 0;
    
    return self;
}

#pragma mark public

-(void)start
{
    self.starting = [NSDate date].timeIntervalSince1970;
}

-(NSInteger)tick
{
    NSInteger timeleft = 0;
    NSUInteger current = [NSDate date].timeIntervalSince1970;
    NSUInteger timeelapsed = current - self.starting;
    timeleft = self.limit - timeelapsed;
    
    return timeleft;
}

-(void)end
{
    NSUInteger timeelapsed;
    self.ending = [NSDate date].timeIntervalSince1970;
    timeelapsed = self.ending - self.starting;
    
    if(timeelapsed < self.limit)
    {
        self.extratime = self.limit - timeelapsed;
    }
}

@end