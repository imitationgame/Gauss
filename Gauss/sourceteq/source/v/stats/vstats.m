#import "vstats.h"

static const NSUInteger barmaxheight = 65;

@implementation vstats

-(instancetype)init:(cstats*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    vstatsbar *bar = [[vstatsbar alloc] init];
    self.bar = bar;
    
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar};
    NSDictionary *metrics = @{};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:barmaxheight];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    
    return self;
}



@end