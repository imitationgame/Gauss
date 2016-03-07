#import "mchallengeoperand.h"

@implementation mchallengeoperand

-(instancetype)init:(CGFloat)value
{
    self = [super init];
    self.value = value;
    self.trivia = NO;
    
    return self;
}

@end