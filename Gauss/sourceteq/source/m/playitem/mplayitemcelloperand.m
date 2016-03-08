#import "mplayitemcelloperand.h"

static NSUInteger const labelfontsize = 40;
static NSUInteger const labelhrmargin = 20;

@interface mplayitemcelloperand ()

@property(weak, nonatomic)mchallengeoperand *model;

@end

@implementation mplayitemcelloperand
{
    NSAttributedString *astring;
}

@dynamic model;

-(instancetype)init:(mchallengeoperand*)model
{
    self = [super init:model];
    self.cellclass = [vplayitemchallengeoperand class];
    
    NSString *string = [[tools singleton] numbertostring:@(model.value)];
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:labelfontsize]};
    astring = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    
    CGRect rectbounding = [astring boundingRectWithSize:CGSizeMake(320, labelfontsize + 5) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil];
    CGSize sizebounding = rectbounding.size;
    CGFloat widthbounding = ceilf(sizebounding.width);
    self.width = widthbounding + (labelhrmargin * 2);
    
    return self;
}

#pragma mark -
#pragma mark item cell

-(void)configure:(vplayitemchallengeoperand*)cell
{
    [cell.label setAttributedText:astring];
}

@end