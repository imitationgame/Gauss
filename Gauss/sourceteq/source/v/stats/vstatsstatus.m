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
        color = [UIColor colorWithRed:0.3 green:0.7 blue:0.8 alpha:1];
    }
    else
    {
        color = colorsecond;
    }
    
    [self setBackgroundColor:color];
}

@end