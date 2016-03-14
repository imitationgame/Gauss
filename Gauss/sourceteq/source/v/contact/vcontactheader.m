#import "vcontactheader.h"

@implementation vcontactheader

-(instancetype)init:(ccontact*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colorsecond];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    return self;
}

@end