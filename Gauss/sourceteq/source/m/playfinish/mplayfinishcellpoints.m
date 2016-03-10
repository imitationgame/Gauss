#import "mplayfinishcellpoints.h"

static NSUInteger const marginvertical = 60;
static NSUInteger const cellvertical = 34;

@implementation mplayfinishcellpoints

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init];
    self.marginvr = marginvertical;
    self.incellheight = cellvertical;
    
    NSUInteger currentscore = chapter.score;
    NSUInteger maxscore = chapter.maxscore;
    CGFloat currentpercent = currentscore / (CGFloat)maxscore;
    
    self.cells = @[
                   [[mplayfinishcellpointscellcurrentscore alloc] init:currentpercent],
                   [[mplayfinishcellpointscellmaxscore alloc] init:1],
                   ];
    
    self.cellheight = self.marginvr * 2;
    self.cellheight += self.incellheight * self.cells.count;
    
    return self;
}


#pragma mark -
#pragma mark finish cell

-(void)configure:(vplayfinishcell*)cell
{
    vplayfinishpoints *overview = [[vplayfinishpoints alloc] init:self];
    [cell configure:overview];
}

@end