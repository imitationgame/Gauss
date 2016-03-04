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
    
    [self addSubview:image];
    
    NSDictionary *views = @{@"image":image};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[image]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[image(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end