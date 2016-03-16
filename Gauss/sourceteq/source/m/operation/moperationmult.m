#import "moperationmult.h"

@implementation moperationmult

-(instancetype)init
{
    self = [super init];
    
    self.symbol = @"x";
    
    return self;
}

#pragma mark -
#pragma mark operation

-(CGFloat)operate:(CGFloat)valuea with:(CGFloat)valueb
{
    CGFloat result;
    
    result = valuea * valueb;
    
    return result;
}

@end