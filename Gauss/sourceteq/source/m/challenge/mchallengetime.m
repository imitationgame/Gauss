#import "mchallengetime.h"

@implementation mchallengetime

-(instancetype)init:(NSUInteger)limit
{
    self = [super init];
    self.limit = limit;
    
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
    
    return timeleft;
}

-(NSUInteger)end
{
    NSUInteger extratime = 0;
    NSUInteger timeelapsed;
    self.ending = [NSDate date].timeIntervalSince1970;
    timeelapsed = self.ending - self.starting;
    
    if(timeelapsed < self.limit)
    {
        extratime = self.limit - timeelapsed;
    }
    
    return extratime;
}

@end