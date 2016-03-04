#import "vstatsheader.h"

@implementation vstatsheader

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setFont:[UIFont fontWithName:fontboldname size:16]];
    [label setTextColor:[UIColor colorWithWhite:0 alpha:0.3]];
    self.label = label;
    
    vstatsstatus *status = [[vstatsstatus alloc] init];
    self.status = status;
    
    [self addSubview:label];
    [self addSubview:status];
    
    NSDictionary *views = @{@"label":label, @"status":status};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[status]-8-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[status]-22-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(mcourseitem*)model
{
    NSString *modelname = model.name;
    BOOL modelstatus = model.available;
    
    [self.label setText:modelname];
    [self.status changestatus:modelstatus];
}

@end