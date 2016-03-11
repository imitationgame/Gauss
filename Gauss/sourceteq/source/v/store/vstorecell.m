#import "vstorecell.h"

@implementation vstorecell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

-(void)config:(mstorepurchasesitem*)item
{
    self.item = item;
}

@end