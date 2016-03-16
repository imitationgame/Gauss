#import "mplayfinishcellpointscellcurrentscore.h"

@implementation mplayfinishcellpointscellcurrentscore

-(instancetype)init:(CGFloat)percent
{
    self = [super init:percent];
    self.name = NSLocalizedString(@"play_finish_points_currentscore", nil);
    
    return self;
}

@end