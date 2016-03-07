#import "vplaybar.h"

@implementation vplaybar

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:colormain];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

@end