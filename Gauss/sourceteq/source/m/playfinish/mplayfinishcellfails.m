#import "mplayfinishcellfails.h"

@implementation mplayfinishcellfails
{
    CGFloat breakpoint;
}

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init];
    self.cellheight = 450;
    
    NSUInteger totalchallenges = chapter.totalchallenges;
    NSUInteger passedchallenges = chapter.passedchallenges;
    CGFloat percentpassed = passedchallenges / (CGFloat)totalchallenges;
    CGFloat degrees = percentpassed * 360;
    CGFloat radians = degrees * M_PI / 180.0;
    breakpoint = radians;
    
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