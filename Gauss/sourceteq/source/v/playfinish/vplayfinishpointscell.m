#import "vplayfinishpointscell.h"

static NSUInteger const labelwidth = 100;
static NSUInteger const labelleft = 20;
static NSUInteger const labelright = 10;
static NSUInteger const barmarginvr = 10;
static NSUInteger const barright = 20;

@implementation vplayfinishpointscell
{
    NSUInteger barleft;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    barleft = labelwidth + labelleft + labelright;
    
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
    NSDictionary *metrics = @{@"labelwidth":@(labelwidth), @"labelleft":@(labelleft), @"labelright":@(labelright), @"barmarginvr":@(barmarginvr), @"barleft":@(barleft)};
    
    self.layoutbarwidth = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(labelheight)-[label(labelwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(barleft)-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(barmarginvr)-[bar]-(barmarginvr)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)config:(mplayfinishcellpointscell*)model
{
    CGFloat cellwidth = self.bounds.size.width;
    CGFloat maxbarwidth = cellwidth - barleft - barright;
    CGFloat barwidth = model.percent * maxbarwidth;
    
    self.layoutbarwidth.constant = barwidth;
    [self.label setText:model.name];
}

@end