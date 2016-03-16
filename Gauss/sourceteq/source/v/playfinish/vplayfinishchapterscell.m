#import "vplayfinishchapterscell.h"

static NSUInteger const margin = 1;
static NSUInteger const innermargin = 4;

@implementation vplayfinishchapterscell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *outercircle = [[UIView alloc] init];
    [outercircle setClipsToBounds:YES];
    [outercircle setUserInteractionEnabled:NO];
    [outercircle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [outercircle setBackgroundColor:colormain];
    [outercircle.layer setCornerRadius:3];
    self.outercircle = outercircle;
    
    UIView *innercircle = [[UIView alloc] init];
    [innercircle setClipsToBounds:YES];
    [innercircle setUserInteractionEnabled:NO];
    [innercircle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [innercircle setBackgroundColor:colorsecond];
    [innercircle.layer setCornerRadius:3];
    self.innercircle = innercircle;
    
    [self addSubview:outercircle];
    [self addSubview:innercircle];
    
    NSDictionary *views = @{@"outer":outercircle, @"inner":innercircle};
    NSDictionary *metrics = @{@"margin":@(margin), @"innermargin":@(innermargin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(innermargin)-[inner]-(innermargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(margin)-[outer]-(margin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(innermargin)-[inner]-(innermargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(margin)-[outer]-(margin)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.selected)
    {
        [self.outercircle setHidden:NO];
    }
    else
    {
        [self.outercircle setHidden:YES];
    }
}

@end