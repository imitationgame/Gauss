#import "vstatsheader.h"

@implementation vstatsheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontboldname size:18]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.5]];
    self.label = label;
    
    UIView *indicator = [[UIView alloc] init];
    [indicator setClipsToBounds:YES];
    [indicator setUserInteractionEnabled:NO];
    [indicator setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.indicator = indicator;
    
    [self addSubview:label];
    [self addSubview:indicator];
    
    NSDictionary *views = @{@"label":label, @"indicator":indicator};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-30-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label(5)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[indicator]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mcourseitem*)model
{
    NSString *modelname = model.name;
    BOOL modelstatus = model.available;
    
    if(modelstatus)
    {
        [self.indicator setBackgroundColor:[UIColor colorWithRed:0.3 green:0.7 blue:0.8 alpha:1]];
    }
    else
    {
        [self.indicator setBackgroundColor:colorsecond];
    }
    
    [self.label setText:modelname];
}

@end