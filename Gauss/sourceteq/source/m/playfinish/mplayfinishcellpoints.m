#import "mplayfinishcellpoints.h"

@implementation mplayfinishcellpoints

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init];
    self.cellheight = 400;
    
    return self;
}


#pragma mark -
#pragma mark finish cell

-(void)configure:(vplayfinishcell*)cell
{
    vplayfinishpoints *overview = [[vplayfinishpoints alloc] init];
    [cell configure:overview];
}

@end