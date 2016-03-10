#import "mplayfinishcellpointscellmaxscore.h"

@implementation mplayfinishcellpointscellmaxscore

-(instancetype)init:(CGFloat)percent
{
    self = [super init:percent];
    self.name = NSLocalizedString(@"play_finish_points_maxscore", nil);
    
    return self;
}

@end