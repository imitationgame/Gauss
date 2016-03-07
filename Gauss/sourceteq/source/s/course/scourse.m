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
    NSUInteger countoperations = self.operations.count;
    
    NSAssert(!countoperations, @"Operations not defined.", NSStringFromClass([self class]));
    
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
        mchallengeoperand *operand;
        CGFloat valuerange = (self.maxnumber + 1) - self.minnumber;
        CGFloat value = arc4random_uniform(valuerange) + self.minnumber;
        BOOL isdecimal = NO;
        
        if(self.decimals)
        {
            NSUInteger shoulddecimal = arc4random_uniform(2);
            
            if(shoulddecimal)
            {
                isdecimal = YES;
            }
        }
        
        if(isdecimal)
        {
            operand = [[mchallengeoperanddouble alloc] init:value];
        }
        else
        {
            operand = [[mchallengeoperandint alloc] init:value];
        }
        
        if(i < totaloperands - 1)
        {
            NSUInteger selectedoperation = 0;
        }
        
        [operands addObject:operand];
    }
    
    challenge.operands = operands;
    challenge.operations = operations;
    challenge.result = result;
}

@end