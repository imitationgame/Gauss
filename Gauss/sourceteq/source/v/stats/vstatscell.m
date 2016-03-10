#import "vstatscell.h"

@implementation vstatscell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
 
    UILabel *labelindex = [[UILabel alloc] init];
    [labelindex setBackgroundColor:[UIColor clearColor]];
    [labelindex setUserInteractionEnabled:NO];
    [labelindex setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelindex setFont:[UIFont fontWithName:fontboldname size:18]];
    [labelindex setTextColor:[UIColor colorWithWhite:0 alpha:0.9]];
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
    
    UILabel *labelelapsed = [[UILabel alloc] init];
    [labelelapsed setBackgroundColor:[UIColor clearColor]];
    [labelelapsed setUserInteractionEnabled:NO];
    [labelelapsed setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelelapsed setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labelelapsed setFont:[UIFont fontWithName:fontregularname size:15]];
    self.labelelapsed = labelelapsed;
    
    UILabel *labelscore = [[UILabel alloc] init];
    [labelscore setBackgroundColor:[UIColor clearColor]];
    [labelscore setUserInteractionEnabled:NO];
    [labelscore setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelscore setTextColor:colorthird];
    [labelscore setFont:[UIFont fontWithName:fontboldname size:18]];
    self.labelscore = labelscore;
    
    [self addSubview:labelindex];
    [self addSubview:labelnotice];
    [self addSubview:labelelapsed];
    [self addSubview:labelscore];
    [self addSubview:status];
    [self addSubview:buttonstore];
    
    NSDictionary *views = @{@"labelindex":labelindex, @"status":status, @"labelnotice":labelnotice, @"labelelapsed":labelelapsed, @"labelscore":labelscore};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[status]-8-[labelindex]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[labelnotice]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[labelelapsed]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[labelscore]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-21-[status]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[labelindex]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-46-[labelnotice]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-46-[labelelapsed]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[labelscore]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self hover];
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self hover];
}

#pragma mark functionality

-(void)hover
{
    if(self.isSelected || self.isHighlighted)
    {
        [self setBackgroundColor:colorsecond];
    }
    else
    {
        if(self.model.available)
        {
            [self setBackgroundColor:[UIColor whiteColor]];
        }
        else
        {
            [self setBackgroundColor:[UIColor clearColor]];
        }
    }
}

#pragma mark public

-(void)config:(mcourseitemchapter*)model
{
    self.model = model;
    
    BOOL modelstatus = model.available;
    BOOL labelnoticehidden = NO;
    NSUInteger timestamp = model.timestmap;
    NSUInteger score = model.maxscore;
    NSString *indexstring = [NSString stringWithFormat:@"%@", @(model.index)];
    NSString *notice = @"";
    NSString *elapsed = @"";
    NSString *scorestring = @"";
    
    if(modelstatus)
    {
        if(timestamp)
        {
            scorestring = [[tools singleton] numbertostring:@(score)];
            
            NSString *timestr = [tools elapsedtimefrom:timestamp];
            elapsed = [NSString stringWithFormat:NSLocalizedString(@"elapsedtime_title", nil), timestr];
            
            labelnoticehidden = YES;
        }
        else
        {
            notice = NSLocalizedString(@"chapter_cel_nevertaken", nil);
        }
    }
    else
    {
        notice = NSLocalizedString(@"chapter_cel_notactive", nil);
    }
    
    [self.labelnotice setText:notice];
    [self.labelnotice setHidden:labelnoticehidden];
    [self.labelelapsed setText:elapsed];
    [self.labelelapsed setHidden:!labelnoticehidden];
    [self.labelscore setText:scorestring];
    [self.labelscore setHidden:!labelnoticehidden];
    [self.labelindex setText:indexstring];
    [self.status changestatus:modelstatus];
    
    [self hover];
}

@end