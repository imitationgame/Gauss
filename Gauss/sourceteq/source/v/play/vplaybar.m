#import "vplaybar.h"

@implementation vplaybar

-(instancetype)init
{
    self = [super init];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

@end