#import "mplayitemcelloperation.h"

static NSUInteger const labelfontsize = 35;
static NSUInteger const labelhrmargin = 4;

@interface mplayitemcelloperation ()

@property(weak, nonatomic)moperation *model;

@end

@implementation mplayitemcelloperation
{
    NSAttributedString *astring;
}

@dynamic model;

-(instancetype)init:(moperation*)model
{
    self = [super init:model];
    self.cellclass = [vplayitemchallengeoperation class];
    
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:labelfontsize]};
    astring = [[NSAttributedString alloc] initWithString:model.symbol attributes:attributes];
    
    CGRect rectbounding = [astring boundingRectWithSize:CGSizeMake(100, labelfontsize + 5) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil];
    CGSize sizebounding = rectbounding.size;
    CGFloat widthbounding = ceilf(sizebounding.width);
    self.width = widthbounding + (labelhrmargin * 2);
    
    return self;
}

#pragma mark -
#pragma mark item cell

-(void)configure:(vplayitemchallengeoperation*)cell
{
    [cell.label setAttributedText:astring];
}

@end