#import "vstore.h"

@interface cstore ()

@property(weak, nonatomic)cstore *controller;

@end

@implementation vstore

@dynamic controller;

-(instancetype)init:(cstore*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    
    return self;
}

@end