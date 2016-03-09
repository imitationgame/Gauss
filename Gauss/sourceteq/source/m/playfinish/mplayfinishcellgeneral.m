#import "mplayfinishcellgeneral.h"

@implementation mplayfinishcellgeneral

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init:chapter];
    
    self.cellheight = 260;
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont fontWithName:fontregularname size:20], NSForegroundColorAttributeName:[UIColor blackColor]};
    NSDictionary *dictsubtitle = @{NSFontAttributeName:[UIFont fontWithName:fontregularname size:16], NSForegroundColorAttributeName:colorthird};
    NSDictionary *dictscore = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:30], NSForegroundColorAttributeName:colormain};
    NSDictionary *dictmax = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:13], NSForegroundColorAttributeName:colorthird};
    NSString *stringtitle = chapter.course.name;
    NSString *stringsubtitle = [NSString stringWithFormat:NSLocalizedString(@"play_finish_subtitle", nil), @(chapter.index)];
    NSString *stringscore = [[tools singleton] numbertostring:@(chapter.score)];
    NSString *stringmax = [[tools singleton] numbertostring:@(chapter.score)];
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dicttitle];
    NSAttributedString *attrsubtitle = [[NSAttributedString alloc] initWithString:stringsubtitle attributes:dictsubtitle];
    NSAttributedString *attrscore = [[NSAttributedString alloc] initWithString:stringscore attributes:dictscore];
    self.string = [[NSMutableAttributedString alloc] init];
    [self.string appendAttributedString:attrtitle];
    [self.string appendAttributedString:attrsubtitle];
    [self.string appendAttributedString:attrscore];
    
    play_finish_maxscore
    
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