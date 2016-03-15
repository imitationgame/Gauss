#import "vstatsinfocell.h"

static NSUInteger const bottomborderheight = 6;

@implementation vstatsinfocell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colormain];
    [self setUserInteractionEnabled:NO];
 
    UIView *bottomborder = [[UIView alloc] init];
    [bottomborder setBackgroundColor:colorsecond];
    [bottomborder setUserInteractionEnabled:NO];
    [bottomborder setClipsToBounds:YES];
    [bottomborder setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:bottomborder];
    
    NSDictionary *views = @{@"bottomborder":bottomborder};
    NSDictionary *metrics = @{@"bottomborderheight":@(bottomborderheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bottomborder]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomborder(bottomborderheight)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mstatsitem*)model
{
    
}

@end