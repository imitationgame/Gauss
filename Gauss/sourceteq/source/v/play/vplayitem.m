#import "vplayitem.h"

@implementation vplayitem

-(instancetype)init:(cplayitem*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

@end