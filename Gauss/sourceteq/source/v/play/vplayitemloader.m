#import "vplayitemloader.h"

@implementation vplayitemloader

-(instancetype)init:(cplayitem*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    
    NSString *stringtitle = controller.challenge.chapter.course.name;
    NSString *stringsubtitle = [NSString stringWithFormat:NSLocalizedString(@"play_loader_subtitle", nil), @(controller.challenge.chapter.index)];
    NSString *stringstats = [NSString stringWithFormat:NSLocalizedString(@"play_loader_stats", nil), @(controller.challenge.chapter.currentchallenge), @(controller.challenge.chapter.totalchallenges)];
    
    NSDictionary *dictitle = @{NSForegroundColorAttributeName:colorthird, NSFontAttributeName:[UIFont fontWithName:fontregularname size:25]};
    NSDictionary *dictsubtitle = @{NSForegroundColorAttributeName:colorsecond, NSFontAttributeName:[UIFont fontWithName:fontregularname size:18]};
    
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dictitle];
    NSAttributedString *attrsubtitle = [[NSAttributedString alloc] initWithString:stringsubtitle attributes:dictsubtitle];
    NSAttributedString *attrstats = [[NSAttributedString alloc] initWithString:stringstats attributes:dictsubtitle];
    
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:attrtitle];
    [mut appendAttributedString:attrsubtitle];
    [mut appendAttributedString:attrstats];
    
    UIButton *buttonstop = [[UIButton alloc] init];
    [buttonstop setBackgroundColor:[UIColor clearColor]];
    [buttonstop setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonstop setImage:[[UIImage imageNamed:@"pause"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonstop setImage:[[UIImage imageNamed:@"pause"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonstop setImage:[[UIImage imageNamed:@"pause"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [buttonstop.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonstop.imageView setClipsToBounds:YES];
    [buttonstop.imageView setTintColor:colormain];
    [buttonstop addTarget:self action:@selector(actionstop:) forControlEvents:UIControlEventTouchDown];
    self.buttonstop = buttonstop;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setAttributedText:mut];
    [label setNumberOfLines:0];
    
    vclock *clock = [[vclock alloc] init:self];
    self.clock = clock;
    
    [self addSubview:label];
    [self addSubview:clock];
    [self addSubview:buttonstop];
    
    NSDictionary *views = @{@"buttonstop":buttonstop, @"label":label, @"clock":clock};
    NSDictionary *metrics = @{@"clocksize":@(clock.size)};
    
    self.layoutclockleft = [NSLayoutConstraint constraintWithItem:clock attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[buttonstop]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[label]-70-[clock]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-70-[buttonstop(clocksize)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutclockleft];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat clocksize = self.clock.size;
    CGFloat screenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat remainwidth = screenwidth - clocksize;
    CGFloat marginwidth = remainwidth / 2.0;
    
    self.layoutclockleft.constant = marginwidth;
    
    [super layoutSubviews];
}

#pragma mark action

-(void)actionstop:(UIButton*)button
{
    if(self.buttonstop.isSelected)
    {
        [self.clock.timer resume];
        [self.buttonstop setSelected:NO];
    }
    else
    {
        [self.clock.timer pause];
        [self.buttonstop setSelected:YES];
    }
}

#pragma mark -
#pragma mark clock del

-(void)clockdone
{
    
}

@end