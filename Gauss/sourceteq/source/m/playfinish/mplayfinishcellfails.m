#import "mplayfinishcellfails.h"

@implementation mplayfinishcellfails

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init];
    self.cellheight = 350;
    
    return self;
}


#pragma mark -
#pragma mark finish cell

-(void)configure:(vplayfinishcell*)cell
{
    vplayfinishfails *overview = [[vplayfinishfails alloc] init];
    [cell configure:overview];
}

@end