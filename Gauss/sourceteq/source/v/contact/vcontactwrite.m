#import "vcontactwrite.h"

@implementation vcontactwrite

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];

    UIFont *font = [UIFont fontWithName:fontregularname size:20];
    UIColor *textcolor = [UIColor colorWithWhite:0.2 alpha:1];
    
    UILabel *labelgeneraltitle = [[UILabel alloc] init];
    [labelgeneraltitle setBackgroundColor:[UIColor clearColor]];
    [labelgeneraltitle setUserInteractionEnabled:NO];
    [labelgeneraltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelgeneraltitle setFont:[UIFont fontWithName:fontregularname size:22]];
    [labelgeneraltitle setTextColor:[UIColor colorWithWhite:0 alpha:0.4]];
    [labelgeneraltitle setText:NSLocalizedString(@"contact_write_generaltitle", nil)];
    
    UIView *fieldnamebase = [[UIView alloc] init];
    [fieldnamebase setBackgroundColor:[colorsecond colorWithAlphaComponent:0.4]];
    [fieldnamebase setClipsToBounds:YES];
    [fieldnamebase.layer setCornerRadius:4];
    [fieldnamebase setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UITextField *fieldname = [[UITextField alloc] init];
    [fieldname setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [fieldname setAutocorrectionType:UITextAutocorrectionTypeNo];
    [fieldname setBackgroundColor:[UIColor clearColor]];
    [fieldname setBorderStyle:UITextBorderStyleNone];
    [fieldname setClearButtonMode:UITextFieldViewModeNever];
    [fieldname setDelegate:self];
    [fieldname setFont:font];
    [fieldname setKeyboardAppearance:UIKeyboardAppearanceLight];
    [fieldname setKeyboardType:UIKeyboardTypeAlphabet];
    [fieldname setReturnKeyType:UIReturnKeyNext];
    [fieldname setSpellCheckingType:UITextSpellCheckingTypeNo];
    [fieldname setTextColor:textcolor];
    [fieldname setTintColor:textcolor];
    [fieldname setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.fieldname = fieldname;
    
    [fieldnamebase addSubview:fieldname];
    
    [self addSubview:labelgeneraltitle];
    [self addSubview:fieldnamebase];
    
    /*
     
     "contact_write_nametitle"="Your name(optional)";
     "contact_write_emailtitle"="Your email(optional)";
     "contact_write_messagetitle"="Message";
     
     */
    
    NSDictionary *views = @{@"labelgeneral":labelgeneraltitle, @"fieldname":fieldname, @"namebase":fieldnamebase};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelgeneral]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[namebase]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[fieldname]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[fieldname]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[labelgeneral]-10-[namebase(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end