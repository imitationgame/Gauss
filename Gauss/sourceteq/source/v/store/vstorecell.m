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
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{@"labelmarginleft":@(labelmarginleft), @"labelmarginright":@(labelmarginright)};
    
    self.layoutlabelheight = [NSLayoutConstraint constraintWithItem:label attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:1];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(labelmarginleft)-[label]-(labelmarginright)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutlabelheight];
    
    return self;
}

-(void)config:(mstorepurchasesitem*)item
{
    CGFloat width = self.bounds.size.width;
    CGFloat labelwidth = width - marginleftright;
    CGFloat labelheight = ([item.attributestring boundingRectWithSize:CGSizeMake(labelwidth, 1000) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin context:nil].size.height);
    
    self.item = item;
    self.layoutlabelheight.constant = labelheight;
    self.label.attributedText = item.attributestring;
}

@end