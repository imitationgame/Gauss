#import "vplayfinishpointscell.h"

static NSUInteger const labelwidth = 100;
static NSUInteger const labelright = 6;
static NSUInteger const barmarginvr = 2;
static NSUInteger const barright = 30;

@implementation vplayfinishpointscell
{
    NSUInteger barleft;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    barleft = labelwidth  + labelright;
    
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
    [label setFont:[UIFont fontWithName:fontregularname size:13]];
    [label setTextColor:colorthird];
    [label setTextAlignment:NSTextAlignmentRight];
    self.label = label;
    
    [self addSubview:bar];
    [self addSubview:label];
    
    NSDictionary *views = @{@"bar":bar, @"label":label};
    NSDictionary *metrics = @{@"labelwidth":@(labelwidth), @"barmarginvr":@(barmarginvr), @"barleft":@(barleft)};
    
    self.layoutbarwidth = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label(labelwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(barleft)-[bar]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(barmarginvr)-[bar]-(barmarginvr)-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarwidth];
    
    return self;
}

-(void)config:(mplayfinishcellpointscell*)model
{
    CGFloat cellwidth = self.bounds.size.width;
    CGFloat maxbarwidth = cellwidth - barleft - barright;
    CGFloat barwidth = model.percent * maxbarwidth;
    CGFloat duration = model.percent + 0.2;
    
    [self.label setText:model.name];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 100), dispatch_get_main_queue(),
                   ^
                   {
                       self.layoutbarwidth.constant = barwidth;
                       
                       [UIView animateWithDuration:duration animations:
                        ^
                        {
                            [self layoutIfNeeded];
                        }];
                   });
}

@end