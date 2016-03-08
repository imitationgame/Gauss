#import "scourse.h"
#import "appdel.h"

static NSInteger const multiplier = 100;
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

#pragma mark functionality

-(moperation*)randomoperation
{
    moperation *operation;
    NSUInteger countoperations = self.operations.count;
    NSUInteger selectedoperation = 0;
    
    if(countoperations > 1)
    {
        selectedoperation = arc4random_uniform((CGFloat)countoperations);
    }
    
    operation = self.operations[selectedoperation];
    
    return operation;
}

-(mchallengeoperand*)randomoperand
{
    mchallengeoperand *operand;
    CGFloat maxnumber = (self.maxnumber + 1) * multiplier;
    CGFloat minnumber = self.minnumber * multiplier;
    CGFloat valuerange = maxnumber - minnumber;
    CGFloat value = arc4random_uniform(valuerange);
    BOOL isdecimal = NO;
    value /= multiplier;
    value += self.minnumber;
    
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
    
    return operand;
}

-(mchallengeoperanddouble*)resultfrom:(NSArray<mchallengeoperand*>*)operands operations:(NSArray<moperation*>*)operations
{
    mchallengeoperanddouble *operand;
    NSUInteger count = operands.count;
    CGFloat sum = 0;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mchallengeoperand *inoperand = operands[i];
        CGFloat currentvalue = inoperand.value;
        
        if(i)
        {
            moperation *operation = operations[i - 1];
            sum = [operation operate:sum with:currentvalue];
        }
        else
        {
            sum += currentvalue;
        }
    }
    
    operand = [[mchallengeoperanddouble alloc] init:sum];
    
    return operand;
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
    NSAssert(self.operations.count, @"Operations not defined", NSStringFromClass([self class]));
    
    NSMutableArray<mchallengeoperand*> *operands = [NSMutableArray array];
    NSMutableArray<moperation*> *operations = [NSMutableArray array];
    mchallengeoperand *result;
    NSInteger totaloperands = self.maxoperands - defaultoperands;
    NSUInteger triviaoperand;
    
    if(totaloperands < 1)
    {
        totaloperands = defaultoperands;
    }
    else
    {
        totaloperands = defaultoperands + arc4random_uniform(totaloperands + 1.0);
    }
    
    triviaoperand = arc4random_uniform((CGFloat)totaloperands);
    
    for(NSUInteger i = 0; i < totaloperands; i++)
    {
        mchallengeoperand *operand = [self randomoperand];
        
        if(i == triviaoperand)
        {
            operand.trivia = YES;
        }
        
        if(i < totaloperands - 1)
        {
            moperation *operation = [self randomoperation];
            [operations addObject:operation];
        }
        
        [operands addObject:operand];
    }
    
    result = [self resultfrom:operands operations:operations];
    
    challenge.operands = operands;
    challenge.operations = operations;
    challenge.result = result;
}

@end