#import "vplayitembar.h"

static NSString* const timerfont = @"Courier";

@implementation vplayitembar

-(instancetype)init:(cplayitem*)controller
{
    self = [super init];
    [self setBackgroundColor:colormain];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonback.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.1]];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback.imageView setClipsToBounds:YES];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonback = buttonback;
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentRight];
    [label setTextColor:[UIColor whiteColor]];
    [label setFont:[UIFont fontWithName:timerfont size:15]];
    self.label = label;
    
    [self addSubview:label];
    [self addSubview:buttonback];
    
    NSDictionary *views = @{@"buttonback":buttonback, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonback(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[buttonback(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[label(50)]" options:0 metrics:metrics views:views]];
    
    [self print:controller.challenge.time.extratime];
    
    return self;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller.timer pause];
    [((vplayitem*)self.controller.view).controls deactivate];
    [self.controller back];
}

#pragma mark public

-(void)print:(NSUInteger)secondsleft
{
    NSUInteger minutes;
    NSUInteger seconds;
    NSString *string;
    NSString *stringminutes;
    NSString *stringseconds;
    
    seconds = secondsleft % 60;
    minutes = secondsleft / 60;
    
    if(seconds < 10)
    {
        stringseconds = [NSString stringWithFormat:@"0%@", @(seconds)];
    }
    else
    {
        stringseconds = [NSString stringWithFormat:@"%@", @(seconds)];
    }
    
    if(minutes < 10)
    {
        stringminutes = [NSString stringWithFormat:@"0%@", @(minutes)];
    }
    else
    {
        stringminutes = [NSString stringWithFormat:@"%@", @(minutes)];
    }
    
    string = [NSString stringWithFormat:NSLocalizedString(@"play_bar_timer", nil), stringminutes, stringseconds];
    [self.label setText:string];
}

@end