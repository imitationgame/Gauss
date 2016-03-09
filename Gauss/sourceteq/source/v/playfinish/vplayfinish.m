#import "vplayfinish.h"

@interface vplayfinish ()

@property(weak, nonatomic)cplayfinish *controller;

@end

@implementation vplayfinish

@dynamic controller;

-(instancetype)init:(cplayfinish*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

@end