#import "vplayitemchallengetriviainput.h"

static NSString* const questionstring = @"?";
static NSString* const questionfont = @"HelveticaNeue-Bold";
static NSUInteger const questionsize = 22;

@implementation vplayitemchallengetriviainput

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:colormain];
    [self setUserInteractionEnabled:NO];
    [self.layer setCornerRadius:4];
    
    UILabel *questionmark = [[UILabel alloc] init];
    [questionmark setUserInteractionEnabled:NO];
    [questionmark setTranslatesAutoresizingMaskIntoConstraints:NO];
    [questionmark setBackgroundColor:[UIColor clearColor]];
    [questionmark setTextAlignment:NSTextAlignmentCenter];
    [questionmark setTextColor:colorsecond];
    [questionmark setText:questionstring];
    [questionmark setFont:[UIFont fontWithName:questionfont size:questionsize]];
    self.questionmark = questionmark;
    
    [self addSubview:questionmark];
    
    NSDictionary *views = @{@"question":questionmark};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[question]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[question]-2-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end