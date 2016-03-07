#import "mchallenge.h"

@implementation mchallenge

-(NSString*)description
{
    NSMutableString *string = [NSMutableString string];
    
    NSUInteger count = self.operands.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mchallengeoperand *operand = self.operands[i];
        [string appendFormat:@"%@", operand];
        
        if(i < count - 1)
        {
            [string appendFormat:@" %@ ", self.operations[i].symbol];
        }
    }
    
    [string appendFormat:@" = %@", self.result];
    
    return string;
}

@end