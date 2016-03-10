#import "vplayfinishchapterscell.h"

@implementation vplayfinishchapterscell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UIView *outercircle = [[UIView alloc] init];
    
    UIView *innercircle = [[UIView alloc] init];
    
    [self addSubview:outercircle];
    [self addSubview:innercircle];
    
    return self;
}

@end