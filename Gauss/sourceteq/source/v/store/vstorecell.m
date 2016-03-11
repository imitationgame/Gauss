#import "vstorecell.h"

static NSUInteger const labelmarginleft = 20;
static NSUInteger const labelmarginright = 150;

@implementation vstorecell
{
    CGFloat marginleftright;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    marginleftright = labelmarginleft + labelmarginright;
 
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setUserInteractionEnabled:NO];
    [label setNumberOfLines:0];
    self.label = label;
    
    UILabel *statuslabel = [[UILabel alloc] init];
    [statuslabel setBackgroundColor:[UIColor clearColor]];
    [statuslabel setUserInteractionEnabled:NO];
    [statuslabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [statuslabel setFont:[UIFont fontWithName:fontregularname size:16]];
    [statuslabel setTextColor:colorthird];
    self.statuslabel = statuslabel;
    
    UIImageView *statusicon = [[UIImageView alloc] init];
    [statusicon setClipsToBounds:YES];
    [statusicon setTranslatesAutoresizingMaskIntoConstraints:NO];
    [statusicon setContentMode:UIViewContentModeScaleAspectFit];
    [statusicon setUserInteractionEnabled:NO];
    [statusicon setImage:[UIImage imageNamed:@"success"]];
    self.statusicon = statusicon;
    
    [self addSubview:label];
    [self addSubview:statuslabel];
    [self addSubview:statusicon];
    
    NSDictionary *views = @{@"label":label, @"statuslabel":statuslabel, @"statusicon":statusicon};
    NSDictionary *metrics = @{@"labelmarginleft":@(labelmarginleft), @"labelmarginright":@(labelmarginright)};
    
    self.layoutlabelheight = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(labelmarginleft)-[label]-(labelmarginright)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[statuslabel]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[statuslabel]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[statusicon(40)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[statusicon(40)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutlabelheight];
    
    return self;
}

-(void)config:(mstorepurchasesitem*)item
{
    CGFloat width = self.bounds.size.width;
    CGFloat labelwidth = width - marginleftright;
    CGFloat labelheight = ceilf([item.attributestring boundingRectWithSize:CGSizeMake(labelwidth, 1000) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
    
    self.item = item;
    self.layoutlabelheight.constant = labelheight;
    self.label.attributedText = item.attributestring;
}

@end