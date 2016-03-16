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
                       NSMutableArray *rawitems = [NSMutableArray array];
                       NSArray *rawlogs = [mdb logs];
                       NSUInteger count = rawlogs.count;
                       
                       for(NSUInteger i = 0; i < count; i++)
                       {
                           NSDictionary *rawlog = rawlogs[i];
                           NSUInteger passed = [rawlog[@"passed"] unsignedIntegerValue];
                           NSUInteger tried = [rawlog[@"tried"] unsignedIntegerValue];
                           CGFloat percent = passed / (CGFloat)tried;
                           
                           mstatsitem *item = [[mstatsitem alloc] init:percent];
                           [rawitems addObject:item];
                       }
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          self.items = rawitems;
                                          [[NSNotificationCenter defaultCenter] postNotificationName:notstatsready object:nil];
                                      });
                   });
}

@end