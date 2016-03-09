#import "vplayfinishbar.h"

@implementation vplayfinishbar

-(instancetype)init
{
    self = [super init];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colorthird];
    
    return self;
}

@end