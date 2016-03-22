#import "vstorebar.h"

@implementation vstorebar

-(instancetype)init:(cstore*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colorthird];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.controller = controller;
    
    UIButton *buttonback = [[UIButton alloc] init];
    [buttonback setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [buttonback setImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [buttonback.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.1]];
    [buttonback.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonback.imageView setClipsToBounds:YES];
    [buttonback addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonrestore = [[UIButton alloc] init];
    [buttonrestore setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonrestore setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonrestore setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonrestore setTitle:NSLocalizedString(@"store_restore", nil) forState:UIControlStateNormal];
    [buttonrestore addTarget:self action:@selector(actionback:) forControlEvents:UIControlEventTouchUpInside];
    [buttonrestore.titleLabel setFont:[UIFont fontWithName:fontregularname size:14]];
    [buttonrestore addTarget:self action:@selector(actionrestore:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setFont:[UIFont fontWithName:fontregularname size:16]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:NSLocalizedString(@"store_title", nil)];
    
    [self addSubview:label];
    [self addSubview:buttonback];
    [self addSubview:buttonrestore];
    
    NSDictionary *views = @{@"buttonback":buttonback, @"label":label, @"buttonrestore":buttonrestore};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[label(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[buttonback(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[buttonback(50)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonrestore(140)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-15-[buttonrestore(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionback:(UIButton*)button
{
    [self.controller back];
}

-(void)actionrestore:(UIButton*)button
{
    [self.controller.model restorepurchases];
}

@end