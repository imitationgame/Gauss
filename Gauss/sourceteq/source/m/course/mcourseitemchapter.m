#import "mcourseitemchapter.h"
#import "mdb.h"

@implementation mcourseitemchapter

-(instancetype)init:(mcourseitem*)course index:(NSUInteger)index
{
    self = [super init];
    self.course = course;
    self.uniqueid = NSStringFromClass([self class]);
    self.timestmap = 0;
    self.totalchallenges = 10;
    self.currentchallenge = 0;
    self.extratime = 0;
    self.score = 0;
    self.index = index;
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

-(BOOL)keepplaying
{
    BOOL keep = NO;
    
    if(self.currentchallenge < self.totalchallenges)
    {
        keep = YES;
    }
    
    return keep;
}

-(mchallenge*)challenge
{
    mchallenge *challenge = [self.strategy challenge];
    self.currentchallenge++;
    
    return challenge;
}

@end