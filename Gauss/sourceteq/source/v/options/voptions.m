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

    voptionsbar *bar = [[voptionsbar alloc] init:controller];
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(65)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end