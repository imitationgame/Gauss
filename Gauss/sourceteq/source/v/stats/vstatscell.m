#import "vstatscell.h"

@implementation vstatscell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
 
    UILabel *labelindex = [[UILabel alloc] init];
    [labelindex setBackgroundColor:[UIColor clearColor]];
    [labelindex setUserInteractionEnabled:NO];
    [labelindex setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelindex setFont:[UIFont fontWithName:fontregularname size:16]];
    [labelindex setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    self.labelindex = labelindex;
    
    vstatsstatus *status = [[vstatsstatus alloc] init];
    self.status = status;
    
    [self addSubview:labelindex];
    [self addSubview:status];
    
    NSDictionary *views = @{@"labelindex":labelindex, @"status":status};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[status]-8-[labelindex]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[status]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[labelindex]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(NSUInteger)index model:(mcourseitemchapter*)model
{
    self.model = model;
    BOOL modelstatus = model.available;
    NSString *indexstring = [NSString stringWithFormat:@"%@", @(index)];
    
    [self.labelindex setText:indexstring];
    [self.status changestatus:modelstatus];
}

@end