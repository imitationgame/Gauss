#import "moperationdiv.h"

@implementation moperationdiv


-(instancetype)init
{
    self = [super init];
    
    self.symbol = @"/";
    
    return self;
}

#pragma mark -
#pragma mark operation

-(CGFloat)operate:(CGFloat)valuea with:(CGFloat)valueb
{
    CGFloat result = 0;
    
    if(valueb != 0)
    {
        result = valuea / valueb;
    }
    
    return result;
}


@end