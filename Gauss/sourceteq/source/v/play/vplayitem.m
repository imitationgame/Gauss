#import "vplayitem.h"

@interface vplayitem ()

@property(weak, nonatomic)cplayitem *controller;

@end

@implementation vplayitem

@dynamic controller;

-(instancetype)init:(cplayitem*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vplayitembar *bar = [[vplayitembar alloc] init:controller];
    self.bar = bar;
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(65)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end