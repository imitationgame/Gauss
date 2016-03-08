#import "vplayitem.h"

static NSUInteger const controlsheight = 50;

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
    
    vplayitemchallenge *challenge = [[vplayitemchallenge alloc] init:controller];
    self.challenge = challenge;
    
    vplayitemcontrols *controls = [[vplayitemcontrols alloc] init:controller];
    self.controls = controls;
    
    [self addSubview:challenge];
    [self addSubview:controls];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar, @"challenge":challenge, @"controls":controls};
    NSDictionary *metrics = @{@"controlsheight":@(controlsheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[challenge]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[controls]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(65)]-0-[challenge]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[controls(controlsheight)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end