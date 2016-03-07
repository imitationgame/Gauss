#import "mchallengeoperand.h"

@implementation mchallengeoperand

-(instancetype)init:(double)value
{
    self = [super init];
    self.value = value;
    self.trivia = NO;
    
    return self;
}

@end