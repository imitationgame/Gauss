#import "mplayitem.h"

@implementation mplayitem

-(instancetype)init:(mchallenge*)challenge
{
    self = [super init];
    self.challenge = challenge;
    self.cells = [NSMutableArray array];
    
    [self parse];
    
    return self;
}

#pragma mark functionality

-(void)parse
{
    NSUInteger countoperands = self.challenge.operands.count;
    
    for(NSUInteger i = 0; i < countoperands; i++)
    {
        mchallengeoperand *operand = self.challenge.operands[i];
        mplayitemcell *cell;
        
        if(operand.trivia)
        {
            cell = [[mplayitemcelltrivia alloc] init:operand];
        }
        else
        {
            cell = [[mplayitemcelloperand alloc] init:operand];
        }
        
        [self.cells addObject:cell];
        
        if(i < countoperands - 1)
        {
            moperation *operation = self.challenge.operations[i];
            mplayitemcelloperation *celloperation = [[mplayitemcelloperation alloc] init:operation];
            
            [self.cells addObject:celloperation];
        }
    }
    
    mplayitemcellequals *cellequals = [[mplayitemcellequals alloc] init];
    mplayitemcellresult *cellresult = [[mplayitemcellresult alloc] init:self.challenge.result];
    
    [self.cells addObject:cellequals];
    [self.cells addObject:cellresult];
}

@end
