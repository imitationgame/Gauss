#import "vstats.h"

@implementation vstats

-(instancetype)init:(cstats*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    vstatsrocket *rocket = [[vstatsrocket alloc] init];
    self.rocket = rocket;
    
    [self addSubview:rocket];
    
    NSDictionary *views = @{@"rocket":rocket};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[rocket]-50-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[rocket(150)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end