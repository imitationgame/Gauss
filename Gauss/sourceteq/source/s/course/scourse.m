#import "scourse.h"
#import "appdel.h"

@implementation scourse

-(instancetype)init
{
    self = [super init];
    self.minnumber = 0;
    self.maxnumber = 9;
    self.maxoperands = 2;
    self.timeout = 10;
    self.decimals = NO;
    
    return self;
}

#pragma mark public

-(mchallenge*)challenge
{
    mchallenge *challenge = [[mchallenge alloc] init];
    challenge.time = [[mchallengetime alloc] init:self.timeout];
    [self make:challenge];
    
    return challenge;
}

-(void)make:(mchallenge*)challenge
{
    NSMutableArray<mchallengeoperand*> *operands = [NSMutableArray array];
    NSMutableArray<moperation*> *operations = [NSMutableArray array];
    mchallengeoperand *result;
    
    challenge.operands = operands;
    challenge.operations = operations;
    challenge.result = result;
}

@end