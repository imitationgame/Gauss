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
    [labelindex setFont:[UIFont fontWithName:fontregularname size:18]];
    [labelindex setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    self.labelindex = labelindex;
    
    UIImageView *iconstatus = [[UIImageView alloc] init];
    [iconstatus setClipsToBounds:YES];
    [iconstatus setContentMode:UIViewContentModeScaleAspectFit];
    [iconstatus setUserInteractionEnabled:NO];
    [iconstatus setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.iconstatus = iconstatus;
    
    [self addSubview:labelindex];
    [self addSubview:iconstatus];
    
    NSDictionary *views = @{@"labelindex":labelindex, @"iconstatus":iconstatus};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[iconstatus(17)]-8-[labelindex]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[iconstatus]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[labelindex]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark public

-(void)config:(NSUInteger)index model:(mcourseitemchapter*)model
{
    self.model = model;
    NSString *indexstring = [NSString stringWithFormat:@"%@", @(index)];
    NSString *assetstatus;
    
    if(model.available)
    {
        assetstatus = @"success";
    }
    else
    {
        assetstatus = @"fail";
    }
    
    [self.labelindex setText:indexstring];
    [self.iconstatus setImage:[UIImage imageNamed:assetstatus]];
}

@end