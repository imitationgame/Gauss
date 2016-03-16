#import "vstatsinfocell.h"

static NSUInteger const marginvertical = 30;

@implementation vstatsinfocell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
 
    UIView *bar = [[UIView alloc] init];
    [bar setBackgroundColor:colorsecond];
    [bar setUserInteractionEnabled:NO];
    [bar setClipsToBounds:YES];
    [bar setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{@"marginvertical":@(marginvertical)};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    
    return self;
}

#pragma mark public

-(void)config:(mstatsitem*)model
{
    CGFloat maxheight = self.bounds.size.height - marginvertical;
    CGFloat height = maxheight * model.percent;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_MSEC * 100), dispatch_get_main_queue(),
                   ^
                   {
                       self.layoutbarheight.constant = height;
                       
                       [UIView animateWithDuration:1.2 animations:
                        ^
                        {
                            [self layoutIfNeeded];
                        }];
                   });
}

@end