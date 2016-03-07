#import "mcourseitemchapter.h"
#import "mdb.h"

@implementation mcourseitemchapter

-(instancetype)init:(mcourseitem*)course
{
    self = [super init];
    self.course = course;
    self.uniqueid = NSStringFromClass([self class]);
    self.timestmap = 0;
    self.totalchallenges = 10;
    self.currentchallenge = 0;
    self.timeout = 10;
    self.extratime = 0;
    self.score = 0;
    self.dbid = 0;
    self.available = NO;
    
    return self;
}

#pragma mark public

-(void)open
{
    self.available = YES;
    [mdb openchapter:self.dbid];
}

@end