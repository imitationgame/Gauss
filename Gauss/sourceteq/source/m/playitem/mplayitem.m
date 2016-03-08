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
        mplayitemcell *cell;
    }
}

@end
