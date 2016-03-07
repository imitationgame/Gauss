#import "scourse.h"
#import "appdel.h"

static NSUInteger const multiplier = 100;
static NSUInteger const defaultoperands = 2;

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
    NSInteger totaloperands = self.maxoperands - defaultoperands;
    
    if(totaloperands < 1)
    {
        totaloperands = defaultoperands;
    }
    else
    {
        totaloperands = defaultoperands + arc4random_uniform(totaloperands + 1.0);
    }
    
    for(NSUInteger i = 0; i < totaloperands; i++)
    {
        mchallengeoperand *operand = [[mchallengeoperand alloc] init];
        
        if(i < totaloperands - 1)
        {
            
        }
    }
    
    challenge.operands = operands;
    challenge.operations = operations;
    challenge.result = result;
}

@end