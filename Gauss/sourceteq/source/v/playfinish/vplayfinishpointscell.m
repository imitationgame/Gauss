#import "vplayfinishpointscell.h"

static NSUInteger const labelwidth = 100;
static NSUInteger const labelleft = 20;
static NSUInteger const labelright = 10;
static NSUInteger const barmarginvr = 10;

@implementation vplayfinishpointscell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *bar = [[UIView alloc] init];
    [bar setClipsToBounds:YES];
    [bar setUserInteractionEnabled:NO];
    [bar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bar setBackgroundColor:colorsecond];
    [bar.layer setCornerRadius:4];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontregularname size:14]];
    [label setTextColor:colorthird];
    self.label = label;
    
    [self addSubview:bar];
    [self addSubview:label];
    
    NSDictionary *views = @{@"bar":bar, @"label":label};
    NSDictionary *metrics = @{@"labelwidth":@()};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label(100)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label(100)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)config:(mplayfinishcellpointscell*)model
{
    [self.label setText:model.name];
}

@end