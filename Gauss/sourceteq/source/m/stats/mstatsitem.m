#import "mstatsitem.h"

@implementation mstatsitem

-(instancetype)init:(CGFloat)percent
{
    self = [super init];
    self.percent = percent;
    
    return self;
}

@end