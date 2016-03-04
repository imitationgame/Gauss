#import "vstatsstatus.h"

@implementation vstatsstatus

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.layer setCornerRadius:4];
    [self.layer setBorderWidth:2];
    [self.layer setBorderColor:colorsecond.CGColor];
    
    return self;
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(24, 16);
    
    return size;
}

#pragma mark public

-(void)changestatus:(BOOL)status
{
    UIColor *color;
    
    if(status)
    {
        color = [UIColor colorWithRed:0.8 green:0.9 blue:0.2 alpha:1];
    }
    else
    {
        color = colorsecond;
    }
    
    [self setBackgroundColor:color];
}

@end