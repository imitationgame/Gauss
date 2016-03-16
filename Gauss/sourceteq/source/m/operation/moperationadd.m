#import "moperationadd.h"

@implementation moperationadd

-(instancetype)init
{
    self = [super init];
    
    self.symbol = @"+";
    
    return self;
}

#pragma mark -
#pragma mark operation

-(CGFloat)operate:(CGFloat)valuea with:(CGFloat)valueb
{
    CGFloat result;
    
    result = valuea + valueb;
    
    return result;
}

@end