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
    
    [self addSubview:border];
    [self addSubview:basefield];
    
    NSDictionary *views = @{@"border":border, @"basefield":basefield};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[basefield]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[basefield]-10-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end