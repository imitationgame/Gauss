#import "mplayfinishcellpointscellmaxcourse.h"

@implementation mplayfinishcellpointscellmaxcourse

-(instancetype)init:(CGFloat)percent
{
    self = [super init:percent];
    self.name = NSLocalizedString(@"play_finish_points_maxcourse", nil);
    
    return self;
}

@end