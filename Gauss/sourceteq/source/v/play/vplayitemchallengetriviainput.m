#import "vplayitemchallengetriviainput.h"

@implementation vplayitemchallengetriviainput

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:colorsecond];
    [self setUserInteractionEnabled:NO];
    [self.layer setCornerRadius:4];
    
    return self;
}

@end