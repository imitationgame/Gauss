#import "vplayitemloader.h"

@implementation vplayitemloader

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *buttonstop = [[UIButton alloc] init];
    [buttonstop setBackgroundColor:[UIColor clearColor]];
    [buttonstop setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonstop setImage:[[UIImage imageNamed:@"pause"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonstop setImage:[[UIImage imageNamed:@"pause"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonstop.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonstop.imageView setClipsToBounds:YES];
    [buttonstop addTarget:self action:@selector(actionstop:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonstop = buttonstop;
    
    [self addSubview:buttonstop];
    
    NSDictionary *views = @{@"buttonstop":buttonstop};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[buttonstop]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-200-[buttonstop(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark action

-(void)actionstop:(UIButton*)button
{
    
}

@end