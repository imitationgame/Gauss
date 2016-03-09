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
    NSDictionary *dictitle = @{NSForegroundColorAttributeName:colorthird, NSFontAttributeName:[UIFont fontWithName:fontregularname size:19]};
    NSDictionary *dictsubtitle = @{NSForegroundColorAttributeName:colorsecond, NSFontAttributeName:[UIFont fontWithName:fontregularname size:17]};
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dictitle];
    NSAttributedString *attrsubtitle = [[NSAttributedString alloc] initWithString:stringsubtitle attributes:dictsubtitle];
    
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:attrtitle];
    [mut appendAttributedString:attrsubtitle];
    
    UIButton *buttonstop = [[UIButton alloc] init];
    [buttonstop setBackgroundColor:[UIColor clearColor]];
    [buttonstop setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonstop setImage:[[UIImage imageNamed:@"pause"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonstop setImage:[[UIImage imageNamed:@"pause"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonstop.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonstop.imageView setClipsToBounds:YES];
    [buttonstop.imageView setTintColor:[UIColor colorWithWhite:0 alpha:0.1]];
    [buttonstop addTarget:self action:@selector(actionstop:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonstop = buttonstop;
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setAttributedText:mut];
    [label setNumberOfLines:0];
    
    [self addSubview:label];
    [self addSubview:buttonstop];
    
    NSDictionary *views = @{@"buttonstop":buttonstop, @"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-100-[buttonstop]-100-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]-200-[buttonstop(100)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark action

-(void)actionstop:(UIButton*)button
{
    
}

@end