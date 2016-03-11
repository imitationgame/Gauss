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
    [labeltitle setText:@"Hello world"];
    [self addSubview:labeltitle];
    
    NSDictionary *views = @{@"labeltitle":labeltitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[labeltitle(100)]" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[labeltitle(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end