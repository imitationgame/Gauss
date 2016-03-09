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
    [challenge setHidden:YES];
    self.challenge = challenge;
    
    vplayitemloader *loader = [[vplayitemloader alloc] init:controller];
    self.loader = loader;
    
    vplayitemcontrols *controls = [[vplayitemcontrols alloc] init:controller];
    [controls setHidden:YES];
    self.controls = controls;
    
    [self addSubview:challenge];
    [self addSubview:loader];
    [self addSubview:controls];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar, @"challenge":challenge, @"controls":controls, @"loader":loader};
    NSDictionary *metrics = @{@"controlsheight":@(controlsheight)};
    
    self.layoutcontrolsbottom = [NSLayoutConstraint constraintWithItem:controls attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[challenge]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[controls]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[loader]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar(65)]-0-[challenge]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-0-[loader]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[controls(controlsheight)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutcontrolsbottom];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedkeyboardchange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedkeyboardchange:(NSNotification*)notification
{
    CGFloat ypos;
    CGRect keyrect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat origin = keyrect.origin.y;
    CGFloat screenheight = [UIScreen mainScreen].bounds.size.height;
    
    if(origin < screenheight)
    {
        ypos = -(screenheight - origin);
    }
    else
    {
        ypos = 0;
    }
    
    self.layoutcontrolsbottom.constant = ypos;
    
    [UIView animateWithDuration:1.5 animations:
     ^
     {
         [self layoutIfNeeded];
     }];
}

#pragma mark public

-(void)start
{
    [self.challenge setHidden:NO];
    [self.controller.challenge.time start];
}

@end