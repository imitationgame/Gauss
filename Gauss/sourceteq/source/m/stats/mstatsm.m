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
                       self.items = [NSMutableArray array];
                       NSArray *rawlogs = [mdb logs];
                       NSUInteger count = rawlogs.count;
                       
                       for(NSUInteger i = 0; i < count; i++)
                       {
                           NSDictionary *rawlog = rawlogs[i];
                           NSUInteger passed = [rawlog[@"passed"] unsignedIntegerValue];
                           NSUInteger tried = [rawlog[@"tried"] unsignedIntegerValue];
                           CGFloat percent = passed / (CGFloat)tried;
                           
                           mstatsitem *item = [[mstatsitem alloc] init:percent];
                           [self.items addObject:item];
                       }
                       
                       [[NSNotificationCenter defaultCenter] postNotificationName:notstatsready object:nil];
                   });
}

@end