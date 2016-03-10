#import "mplayfinishcellchapters.h"

static NSUInteger const marginvertical = 60;
static NSUInteger const cellsize = 50;

@implementation mplayfinishcellchapters

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init];
    self.cellheight = cellsize + (marginvertical * 2);
    self.marginvr = marginvertical;
    self.incellsize = cellsize;
    self.totalchapters = chapter.course.chapters.count;
    self.currentchapter = chapter.index - 1;
    self.totalcellswidth = cellsize * self.totalchapters;
    
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