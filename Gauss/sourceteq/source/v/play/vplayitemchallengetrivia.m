#import "vplayitemchallengetrivia.h"

static NSUInteger const hrmargin = 2;
static NSUInteger const vrmargin = 2;

@implementation vplayitemchallengetrivia

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    
    vplayitemchallengetriviainput *input = [[vplayitemchallengetriviainput alloc] init];
    self.input = input;
    
    [self addSubview:input];
    
    NSDictionary *views = @{@"input":input};
    NSDictionary *metrics = @{@"hrmargin":@(hrmargin), @"vrmargin":@(vrmargin)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(hrmargin)-[input]-(hrmargin)-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(vrmargin)-[input]-(vrmargin)-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end