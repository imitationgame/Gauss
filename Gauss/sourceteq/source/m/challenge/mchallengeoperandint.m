#import "mchallengeoperandint.h"

@implementation mchallengeoperandint

-(instancetype)init:(CGFloat)value
{
    self = [super init:ceilf(value)];
    
    return self;
}

@end