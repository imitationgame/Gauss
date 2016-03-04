#import "vstatscell.h"

@implementation vstatscell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

#pragma mark public

-(void)config:(NSUInteger)index model:(mcourseitemchapter*)model
{
    self.model = model;
}

@end