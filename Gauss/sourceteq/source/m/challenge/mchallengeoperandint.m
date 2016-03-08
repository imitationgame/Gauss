#import "mchallengeoperandint.h"

@implementation mchallengeoperandint

-(instancetype)init:(CGFloat)value
{
    self = [super init:floorf(value)];
    
    return self;
}

@end