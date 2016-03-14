#import "vcontactheader.h"

@implementation vcontactheader

-(instancetype)init:(ccontact*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colorsecond];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonback.imageView setClipsToBounds:YES];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback.imageView setTintColor:[UIColor blackColor]];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont fontWithName:fontregularname size:18]];
    [label setTextColor:[UIColor blackColor]];
    [label setText:NSLocalizedString(@"contact_title", nil)];
    
    [self addSubview:label];
    [self addSubview:buttonback];
    
    NSDictionary *views = @{@"buttonback":buttonback, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonback(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[buttonback(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[label(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma amrk actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

@end