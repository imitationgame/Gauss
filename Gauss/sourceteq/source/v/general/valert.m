#import "valert.h"

@implementation valert

+(void)alert:(NSString*)message inview:(UIView*)view offsettop:(CGFloat)offsettop
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       valert *alert = [[valert alloc] init:message];
                       [view addSubview:alert];
                       
                       NSDictionary *views = @{@"alert":alert};
                       NSDictionary *metrics = @{@"top":@(offsettop)};
                       
                       [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[alert]-0-|" options:0 metrics:metrics views:views]];
                       [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(top)-[alert]" options:0 metrics:metrics views:views]];
                       
                       [alert show];
                   });
}

-(instancetype)init:(NSString*)message
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setAlpha:0];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setBackgroundColor:colormain];
    
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setBackgroundColor:[UIColor clearColor]];
    [lbl setUserInteractionEnabled:NO];
    [lbl setNumberOfLines:0];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    [lbl setTextColor:colorsecond];
    [lbl setFont:[UIFont fontWithName:fontregularname size:18]];
    [lbl setText:message];
    [lbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:lbl];
    
    NSDictionary *views = @{@"lbl":lbl};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[lbl]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[lbl]-12-|" options:0 metrics:metrics views:views]];
    
    [NSTimer scheduledTimerWithTimeInterval:3.5 target:self selector:@selector(timeout:) userInfo:nil repeats:NO];
    
    return self;
}

#pragma mark functionality

-(void)timeout:(NSTimer*)timer
{
    [timer invalidate];
    [self hide];
}

#pragma mark public

-(void)show
{
    [UIView animateWithDuration:0.5 animations:
     ^
     {
         [self setAlpha:1];
     }];
}

-(void)hide
{
    [UIView animateWithDuration:0.5 animations:
     ^
     {
         [self setAlpha:0];
     } completion:
     ^(BOOL done)
     {
         [self removeFromSuperview];
     }];
}

@end