#import "mchallengeoperandint.h"

@implementation mchallengeoperandint

-(instancetype)init:(double)value
{
    self = [super init:ceilf(value)];
    
    return self;
}

@end