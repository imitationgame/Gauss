#import "voptionsbar.h"

@implementation voptionsbar

-(instancetype)init:(coptions*)controller
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:[UIColor colorWithRed:0.3 green:0.7 blue:0.8 alpha:1]];
    [self setClipsToBounds:YES];
    self.controller = controller;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setTextColor:[UIColor whiteColor]];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    [labeltitle setFont:[UIFont fontWithName:fontregularname size:18]];
    [labeltitle setText:NSLocalizedString(@"options_title", nil)];
    
    UIButton *buttonstats = [[UIButton alloc] init];
    [buttonstats setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonstats setImage:[[UIImage imageNamed:@"rocket"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonstats setImage:[[UIImage imageNamed:@"rocket"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonstats.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonstats.imageView setClipsToBounds:YES];
    [buttonstats.imageView setTintColor:[UIColor whiteColor]];
    [buttonstats addTarget:self action:@selector(actionopenstats:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:labeltitle];
    [self addSubview:buttonstats];
    
    NSDictionary *views = @{@"labeltitle":labeltitle, @"buttonstats":buttonstats};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[labeltitle(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[buttonstats(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonstats(60)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionopenstats:(UIButton*)button
{
    [self.controller openstats];
}

@end