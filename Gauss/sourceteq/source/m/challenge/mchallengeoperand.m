#import "mchallengeoperand.h"
#import "appdel.h"

@implementation mchallengeoperand

-(instancetype)init:(CGFloat)value
{
    self = [super init];
    self.value = value;
    self.trivia = NO;
    
    return self;
}

-(NSString*)description
{
    NSNumber *number = @(self.value);
    NSString *string = [[tools singleton] numbertostring:number];
    
    return string;
}

@end