#import "vstatsrocket.h"

@implementation vstatsrocket

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    UIImageView *imagerocket = [[UIImageView alloc] init];
    [imagerocket setClipsToBounds:YES];
    [imagerocket setUserInteractionEnabled:NO];
    [imagerocket setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imagerocket setContentMode:UIViewContentModeScaleAspectFit];
    [imagerocket setImage:[[UIImage imageNamed:@"rocket"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [imagerocket setTintColor:colorsecond];
    self.imagerocket = imagerocket;
    
    UIImageView *imagefire = [[UIImageView alloc] init];
    [imagefire setClipsToBounds:YES];
    [imagefire setUserInteractionEnabled:NO];
    [imagefire setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imagefire setContentMode:UIViewContentModeScaleAspectFit];
    [imagefire setImage:[[UIImage imageNamed:@"fire"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [imagefire setTintColor:colormain];
    [imagefire setHidden:YES];
    self.imagefire = imagefire;
    
    [self addSubview:imagerocket];
    [self addSubview:imagefire];
    
    NSDictionary *views = @{@"rocket":imagerocket, @"fire":imagefire};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[rocket]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[fire]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[rocket(90)]-(-30)-[fire(90)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self.imagefire setHidden:NO];
}

-(void)touchesEnded:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self.imagefire setHidden:YES];
}

@end