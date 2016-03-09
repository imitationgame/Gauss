#import "mchallengetime.h"

@implementation mchallengetime

-(instancetype)init:(NSUInteger)limit
{
    self = [super init];
    self.limit = limit;
    self.extratime = limit;
    self.timer = [timerbg millis:1000 delegate:self background:YES];
    
    return self;
}

#pragma mark -
#pragma mark timer del

-(void)timerbgtick
{
    self.extratime--;
}

@end