#import "vstatsbar.h"

@implementation vstatsbar

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colormain];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

@end