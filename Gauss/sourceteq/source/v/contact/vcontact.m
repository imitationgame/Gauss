#import "vcontact.h"

@interface vcontact ()

@property(weak, nonatomic)ccontact *controller;

@end

@implementation vcontact

@dynamic controller;

-(instancetype)init:(ccontact*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    return self;
}

@end