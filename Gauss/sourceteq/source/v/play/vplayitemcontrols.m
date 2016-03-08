#import "vplayitemcontrols.h"

@implementation vplayitemcontrols
{
    BOOL submited;
}

-(instancetype)init:(cplayitem*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[colorsecond colorWithAlphaComponent:0.2]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    submited = NO;
    
    UIView *border = [[UIView alloc] init];
    [border setUserInteractionEnabled:NO];
    [border setClipsToBounds:YES];
    [border setBackgroundColor:[colorsecond colorWithAlphaComponent:0.5]];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *basefield = [[UIView alloc] init];
    [basefield setBackgroundColor:[UIColor whiteColor]];
    [basefield setClipsToBounds:YES];
    [basefield setTranslatesAutoresizingMaskIntoConstraints:NO];
    [basefield.layer setCornerRadius:4];
    [basefield.layer setBorderWidth:1];
    [basefield.layer setBorderColor:[colorsecond colorWithAlphaComponent:0.6].CGColor];
    
    UIButton *buttonnext = [[UIButton alloc] init];
    [buttonnext setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonnext setClipsToBounds:YES];
    [buttonnext setImage:[[UIImage imageNamed:@"next"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [buttonnext setImage:[[UIImage imageNamed:@"next"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [buttonnext setImage:[[UIImage imageNamed:@"next"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
    [buttonnext.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [buttonnext.imageView setClipsToBounds:YES];
    [buttonnext.imageView setTintColor:colormain];
    [buttonnext addTarget:self action:@selector(actionnext:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonnext = buttonnext;
    
    UITextField *field = [[UITextField alloc] init];
    [field setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [field setAutocorrectionType:UITextAutocorrectionTypeNo];
    [field setBackgroundColor:[UIColor clearColor]];
    [field setBorderStyle:UITextBorderStyleNone];
    [field setClearButtonMode:UITextFieldViewModeNever];
    [field setClearsOnBeginEditing:NO];
    [field setClearsOnInsertion:NO];
    [field setClipsToBounds:YES];
    [field setDelegate:self];
    [field setFont:[UIFont fontWithName:fontregularname size:18]];
    [field setKeyboardAppearance:UIKeyboardAppearanceLight];
    [field setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
    [field setReturnKeyType:UIReturnKeyDone];
    [field setSpellCheckingType:UITextSpellCheckingTypeNo];
    [field setTextColor:[UIColor blackColor]];
    [field setTintColor:[UIColor blackColor]];
    [field setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.field = field;
    
    [basefield addSubview:field];
    [self addSubview:border];
    [self addSubview:basefield];
    [self addSubview:buttonnext];
    
    NSDictionary *views = @{@"border":border, @"basefield":basefield, @"buttonnext":buttonnext, @"field":field};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-6-[basefield]-0-[buttonnext(70)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[border(1)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-6-[basefield]-6-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[buttonnext]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-7-[field]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-2-[field]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark actions

-(void)actionnext:(UIButton*)button
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [self submit];
}

#pragma mark functionality

-(void)submit
{
    if(!submited)
    {
        submited = YES;
        [self setUserInteractionEnabled:NO];
        [self.buttonnext setSelected:YES];
        [self.controller submit:self.field.text];
    }
}

#pragma mark -
#pragma mark field del

-(void)textFieldDidEndEditing:(UITextField*)field
{
    [self submit];
}

-(BOOL)textFieldShouldReturn:(UITextField*)field
{
    [field resignFirstResponder];
    
    return YES;
}

@end