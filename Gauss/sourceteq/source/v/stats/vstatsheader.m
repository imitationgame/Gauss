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
    [label setFont:[UIFont fontWithName:fontboldname size:20]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    self.label = label;
    
    UIView *indicator = [[UIView alloc] init];
    [indicator setClipsToBounds:YES];
    [indicator setUserInteractionEnabled:NO];
    [indicator setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.indicator = indicator;
    
    UIButton *buttonstore = [[UIButton alloc] init];
    [buttonstore setClipsToBounds:YES];
    [buttonstore setBackgroundColor:colormain];
    [buttonstore setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonstore setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonstore setTitle:NSLocalizedString(@"chapter_cel_buttonstore", nil) forState:UIControlStateNormal];
    [buttonstore.titleLabel setFont:[UIFont fontWithName:fontboldname size:14]];
    [buttonstore.layer setCornerRadius:4];
    [buttonstore setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonstore addTarget:self action:@selector(actionstore:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonstore = buttonstore;
    
    [self addSubview:label];
    [self addSubview:indicator];
    [self addSubview:buttonstore];
    
    NSDictionary *views = @{@"label":label, @"indicator":indicator, @"buttonstore":buttonstore};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[indicator(6)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[indicator]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonstore(34)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonstore(75)]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionstore:(UIButton*)button
{
    [cstore show];
}

#pragma mark public

-(void)config:(mcourseitem*)model
{
    NSString *modelname = model.name;
    BOOL modelstatus = model.available;
    
    if(modelstatus)
    {
        [self.buttonstore setHidden:YES];
        [self.indicator setBackgroundColor:[UIColor colorWithRed:0.3 green:0.7 blue:0.8 alpha:1]];
    }
    else
    {
        [self.buttonstore setHidden:NO];
        [self.indicator setBackgroundColor:colorsecond];
    }
    
    [self.label setText:modelname];
}

@end