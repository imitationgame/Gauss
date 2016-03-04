#import "vstats.h"

static const NSUInteger rocketwidth = 100;

@implementation vstats

-(instancetype)init:(cstats*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    vstatsrocket *rocket = [[vstatsrocket alloc] init];
    self.rocket = rocket;
    
    [self addSubview:rocket];
    
    self.consrocketleft = [NSLayoutConstraint constraintWithItem:rocket attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:1];
    NSDictionary *views = @{@"rocket":rocket};
    NSDictionary *metrics = @{@"rocketwidth":@(rocketwidth)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[rocket(rocketwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[rocket(150)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.consrocketleft];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat totalwidth = self.bounds.size.width;
    CGFloat width_rocket = totalwidth - rocketwidth;
    CGFloat margin = width_rocket / 2.0;
    self.consrocketleft.constant = margin;
    
    [super layoutSubviews];
}

@end