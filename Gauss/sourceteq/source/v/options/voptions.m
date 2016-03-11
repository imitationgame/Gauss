#import "voptions.h"

@interface voptions ()

@property(weak, nonatomic)coptions *controller;

@end

@implementation voptions

@dynamic controller;

-(instancetype)init:(coptions*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];

    
    return self;
}

@end