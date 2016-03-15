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
    
    UILabel *labelnametitle = [[UILabel alloc] init];
    [labelnametitle setBackgroundColor:[UIColor clearColor]];
    [labelnametitle setUserInteractionEnabled:NO];
    [labelnametitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelnametitle setFont:[UIFont fontWithName:fontregularname size:18]];
    [labelnametitle setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labelnametitle setText:NSLocalizedString(@"contact_write_nametitle", nil)];
    
    UILabel *labelemailtitle = [[UILabel alloc] init];
    [labelemailtitle setBackgroundColor:[UIColor clearColor]];
    [labelemailtitle setUserInteractionEnabled:NO];
    [labelemailtitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelemailtitle setFont:[UIFont fontWithName:fontregularname size:18]];
    [labelemailtitle setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labelemailtitle setText:NSLocalizedString(@"contact_write_emailtitle", nil)];
    
    UIView *fieldnamebase = [[UIView alloc] init];
    [fieldnamebase setBackgroundColor:[colorsecond colorWithAlphaComponent:0.4]];
    [fieldnamebase setClipsToBounds:YES];
    [fieldnamebase.layer setCornerRadius:4];
    [fieldnamebase setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *fieldemailbase = [[UIView alloc] init];
    [fieldemailbase setBackgroundColor:[colorsecond colorWithAlphaComponent:0.4]];
    [fieldemailbase setClipsToBounds:YES];
    [fieldemailbase.layer setCornerRadius:4];
    [fieldemailbase setTranslatesAutoresizingMaskIntoConstraints:NO];
    
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
    
    UITextField *fieldemail = [[UITextField alloc] init];
    [fieldemail setAutocapitalizationType:UITextAutocapitalizationTypeWords];
    [fieldemail setAutocorrectionType:UITextAutocorrectionTypeNo];
    [fieldemail setBackgroundColor:[UIColor clearColor]];
    [fieldemail setBorderStyle:UITextBorderStyleNone];
    [fieldemail setClearButtonMode:UITextFieldViewModeNever];
    [fieldemail setDelegate:self];
    [fieldemail setFont:font];
    [fieldemail setKeyboardAppearance:UIKeyboardAppearanceLight];
    [fieldemail setKeyboardType:UIKeyboardTypeAlphabet];
    [fieldemail setReturnKeyType:UIReturnKeyNext];
    [fieldemail setSpellCheckingType:UITextSpellCheckingTypeNo];
    [fieldemail setTextColor:textcolor];
    [fieldemail setTintColor:textcolor];
    [fieldemail setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.fieldemail = fieldemail;
    
    [fieldnamebase addSubview:fieldname];
    [fieldemailbase addSubview:fieldemail];
    [self addSubview:labelgeneraltitle];
    [self addSubview:labelnametitle];
    [self addSubview:labelemailtitle];
    [self addSubview:fieldnamebase];
    [self addSubview:fieldemailbase];
    
    /*
     
     "contact_write_nametitle"="Your name(optional)";
     "contact_write_emailtitle"="Your email(optional)";
     "contact_write_messagetitle"="Message";
     
     */
    
    NSDictionary *views = @{@"labelgeneral":labelgeneraltitle, @"fieldname":fieldname, @"namebase":fieldnamebase, @"labelname":labelnametitle, @"labelemail":labelemailtitle, @"emailbase":fieldemailbase};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelgeneral]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelname]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labelemail]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[namebase]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[emailbase]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[fieldname]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[fieldname]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-8-[fieldemail]-5-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[fieldemail]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[labelgeneral]-20-[labelname]-10-[namebase(50)]-50-[labelemail]-10-[emailbase(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end