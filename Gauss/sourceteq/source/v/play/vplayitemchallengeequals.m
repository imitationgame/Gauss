#import "vplayitemchallengeequals.h"

static NSUInteger const barhrmargin = 2;
static NSUInteger const barheight = 6;
static NSUInteger const barspacing = 3;

@implementation vplayitemchallengeequals
{
    CGFloat usedheight;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    UIView *topbar = [[UIView alloc] init];
    [topbar setUserInteractionEnabled:NO];
    [topbar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [topbar setClipsToBounds:YES];
    [topbar setBackgroundColor:colorsecond];
    
    UIView *bottombar = [[UIView alloc] init];
    [bottombar setUserInteractionEnabled:NO];
    [bottombar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bottombar setClipsToBounds:YES];
    [bottombar setBackgroundColor:colorsecond];
    
    [self addSubview:topbar];
    [self addSubview:bottombar];
    
    usedheight = (barheight * 2) + barspacing;
    
    NSDictionary *views = @{@"top":topbar, @"bottom":bottombar};
    NSDictionary *metrics = @{@"hrmargin":@(barhrmargin), @"height":@(barheight), @"spacing":@(barspacing)};
    
    self.layouttopbar = [NSLayoutConstraint constraintWithItem:topbar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(hrmargin)-[top]-(hrmargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(hrmargin)-[bottom]-(hrmargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[top(height)]-(spacing)-[bottom(height)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layouttopbar];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat totalheight = self.bounds.size.height;
    CGFloat remaining = totalheight - usedheight;
    CGFloat margin = remaining / 2.0;
    self.layouttopbar.constant = margin;
    
    [super layoutSubviews];
}

@end