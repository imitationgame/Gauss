#import "vstatsbar.h"

@implementation vstatsbar

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colormain];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIImageView *image = [[UIImageView alloc] init];
    [image setClipsToBounds:YES];
    [image setContentMode:UIViewContentModeScaleAspectFit];
    [image setUserInteractionEnabled:NO];
    [image setImage:[[UIImage imageNamed:@"rocket"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [image setTintColor:[UIColor whiteColor]];
    [image setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *buttonoptions = [[UIButton alloc] init];
    [buttonoptions setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonoptions setImage:[[UIImage imageNamed:@"burger"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonoptions setImage:[[UIImage imageNamed:@"burger"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonoptions.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.2]];
    [buttonoptions.imageView setClipsToBounds:YES];
    [buttonoptions.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonoptions setBackgroundColor:[UIColor clearColor]];
    [buttonoptions addTarget:self action:@selector(actionoptions:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:image];
    [self addSubview:buttonoptions];
    
    NSDictionary *views = @{@"image":image, @"buttonoptions":buttonoptions};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[image]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[image(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonoptions(80)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[buttonoptions(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionoptions:(UIButton*)button
{
    
}

@end