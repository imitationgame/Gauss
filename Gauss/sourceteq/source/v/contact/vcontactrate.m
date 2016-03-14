#import "vcontactrate.h"

@implementation vcontactrate

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setFont:[UIFont fontWithName:fontregularname size:16]];
    [label setTextColor:colorthird];
    [label setBackgroundColor:[UIColor clearColor]];
    
    [self addSubview:label];
    
    NSDictionary *views = @{};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end