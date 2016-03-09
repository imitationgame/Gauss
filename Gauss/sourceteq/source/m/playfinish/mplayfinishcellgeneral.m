#import "mplayfinishcellgeneral.h"

@implementation mplayfinishcellgeneral

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init:chapter];
    
    self.cellheight = 100;
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont fontWithName:fontregularname size:18], NSForegroundColorAttributeName:colormain};
    NSDictionary *dictsubtitle = @{NSFontAttributeName:[UIFont fontWithName:fontregularname size:16], NSForegroundColorAttributeName:colorthird};
    NSDictionary *dictscore = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:26], NSForegroundColorAttributeName:colormain};
    NSString *stringtitle = chapter.course.name;
    NSString *stringsubtitle = [NSString stringWithFormat:NSLocalizedString(@"play_finish_subtitle", nil), @(chapter.index)];
    NSString *stringscore = [[tools singleton] numbertostring:@(chapter.score)];
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dicttitle];
    NSAttributedString *attrsubtitle = [[NSAttributedString alloc] initWithString:stringsubtitle attributes:dictsubtitle];
    NSAttributedString *attrscore = [[NSAttributedString alloc] initWithString:stringscore attributes:dictscore];
    self.string = [[NSMutableAttributedString alloc] init];
    [self.string appendAttributedString:attrtitle];
    [self.string appendAttributedString:attrsubtitle];
    [self.string appendAttributedString:attrscore];
    
    return self;
}

#pragma mark -
#pragma mark finish cell

-(void)configure:(vplayfinishcell*)cell
{
    vplayfinishgeneral *overview = [[vplayfinishgeneral alloc] init:self.string];
    [cell configure:overview];
}

@end