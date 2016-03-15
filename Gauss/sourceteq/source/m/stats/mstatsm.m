#import "mstatsm.h"
@implementation mstatsm

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(void)refresh
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       NSArray *rawlogs = [mdb logs];
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notstatsready object:nil];
                   });
}

@end