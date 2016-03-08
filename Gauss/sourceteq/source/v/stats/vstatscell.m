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
    [labelindex setTextColor:[UIColor colorWithWhite:0 alpha:0.7]];
    self.labelindex = labelindex;
    
    vstatsstatus *status = [[vstatsstatus alloc] init];
    self.status = status;
    
    UILabel *labelnotice = [[UILabel alloc] init];
    [labelnotice setBackgroundColor:[UIColor clearColor]];
    [labelnotice setUserInteractionEnabled:NO];
    [labelnotice setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelnotice setTextColor:[UIColor colorWithWhite:0 alpha:0.3]];
    [labelnotice setFont:[UIFont fontWithName:fontregularname size:16]];
    self.labelnotice = labelnotice;
    
    UIButton *buttonplay = [[UIButton alloc] init];
    [buttonplay setClipsToBounds:YES];
    [buttonplay setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonplay setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [buttonplay setImage:[[UIImage imageNamed:@"play"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonplay.imageView setTintColor:colormain];
    [buttonplay.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonplay.imageView setClipsToBounds:YES];
    [buttonplay addTarget:self action:@selector(actionplay:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonplay = buttonplay;
    
    [self addSubview:labelindex];
    [self addSubview:labelnotice];
    [self addSubview:status];
    [self addSubview:buttonplay];
    
    NSDictionary *views = @{@"labelindex":labelindex, @"status":status, @"labelnotice":labelnotice, @"buttonplay":buttonplay};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[status]-8-[labelindex]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[labelnotice]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-21-[status]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[labelindex]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[labelnotice]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonplay(80)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonplay(60)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionplay:(UIButton*)button
{
    [self.controller play:self.model];
}

#pragma mark public

-(void)config:(mcourseitemchapter*)model controller:(cstats*)controller
{
    self.controller = controller;
    self.model = model;
    BOOL modelstatus = model.available;
    BOOL labelnoticehidden = NO;
    BOOL buttonplayhidden = YES;
    NSUInteger timestamp = model.timestmap;
    NSUInteger score = model.score;
    NSString *indexstring = [NSString stringWithFormat:@"%@", @(model.index)];
    NSString *notice = @"";
    
    if(modelstatus)
    {
        if(timestamp)
        {
            labelnoticehidden = YES;
        }
        else
        {
            notice = NSLocalizedString(@"chapter_cel_nevertaken", nil);
        }
        
        buttonplayhidden = NO;
    }
    else
    {
        notice = NSLocalizedString(@"chapter_cel_notactive", nil);
    }
    
    [self.labelnotice setText:notice];
    [self.labelnotice setHidden:labelnoticehidden];
    [self.labelindex setText:indexstring];
    [self.status changestatus:modelstatus];
    [self.buttonplay setHidden:buttonplayhidden];
}

@end