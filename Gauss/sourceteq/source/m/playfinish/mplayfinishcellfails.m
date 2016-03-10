#import "mplayfinishcellfails.h"

@implementation mplayfinishcellfails
{
    CGFloat breakpoint;
}

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init];
    self.cellheight = 400;
    
    breakpoint = 2;
    
    return self;
}


#pragma mark -
#pragma mark finish cell

-(void)configure:(vplayfinishcell*)cell
{
    vplayfinishfails *overview = [[vplayfinishfails alloc] init:breakpoint];
    [cell configure:overview];
}

@end