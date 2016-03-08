#import "vplayitemcontrols.h"

@implementation vplayitemcontrols

-(instancetype)init:(cplayitem*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[colorsecond colorWithAlphaComponent:0.2]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setBackgroundColor:[colorsecond colorWithAlphaComponent:0.5]];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *basefield = [[UIView alloc] init];
    [basefield setBackgroundColor:[UIColor whiteColor]];
    [basefield setClipsToBounds:YES];
    [basefield setTranslatesAutoresizingMaskIntoConstraints:NO];
    [basefield.layer setCornerRadius:4];
    [basefield.layer setBorderWidth:1];
    [basefield.layer setBorderColor:[colorsecond colorWithAlphaComponent:0.5].CGColor];
    
    UIButton *buttonnext = [[UIButton alloc] init];
    [buttonnext setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonnext setClipsToBounds:YES];
    [buttonnext setImage:[[UIImage imageNamed:@"next"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonnext setImage:[[UIImage imageNamed:@"next"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonnext.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonnext.imageView setClipsToBounds:YES];
    [buttonnext.imageView setTintColor:colormain];
    [buttonnext addTarget:self action:@selector(actionnext:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonnext = buttonnext;
    
    [self addSubview:border];
    [self addSubview:basefield];
    [self addSubview:buttonnext];
    
    NSDictionary *views = @{@"border":border, @"basefield":basefield, @"buttonnext":buttonnext};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[basefield]-0-[buttonnext(80)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[basefield]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[buttonnext]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionnext:(UIButton*)button
{
    
}

@end