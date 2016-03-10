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
    CGFloat maxcourse = maxscore;
    
    NSUInteger countchapters = chapter.course.chapters.count;
    
    for(NSUInteger i = 0; i < countchapters; i++)
    {
        mcourseitemchapter *inchapter = chapter.course.chapters[i];
        
        if(inchapter != chapter)
        {
            maxcourse = MAX(maxcourse, inchapter.maxscore);
        }
    }
    
    CGFloat currentpercent = currentscore / maxcourse;
    CGFloat maxpercent = maxscore / maxcourse;
    
    self.cells = @[
                   [[mplayfinishcellpointscellcurrentscore alloc] init:currentpercent],
                   [[mplayfinishcellpointscellmaxscore alloc] init:maxpercent],
                   [[mplayfinishcellpointscellmaxcourse alloc] init:1],
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