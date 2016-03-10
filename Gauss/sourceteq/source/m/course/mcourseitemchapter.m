#import "mcourseitemchapter.h"
#import "mdb.h"

@implementation mcourseitemchapter

-(instancetype)init
{
    self = [super init];
    self.uniqueid = NSStringFromClass([self class]);
//    self.totalchallenges = 10;
        self.totalchallenges = 2;
    self.timestmap = 0;
    self.index = 0;
    self.dbid = 0;
    self.maxscore = 0;
    self.oldmaxscore = 0;
    self.totaltried = 0;
    self.totalpassed = 0;
    self.available = NO;
    
    return self;
}

#pragma mark public

-(void)startplaying
{
    self.currentchallenge = 0;
    self.passedchallenges = 0;
    self.extratime = 0;
    self.score = 0;
}

-(void)open
{
    self.available = YES;
    [mdb openchapter:self.dbid];
}

-(void)save
{
    self.totaltried += self.totalchallenges;
    self.totalpassed += self.passedchallenges;
    self.oldmaxscore = self.maxscore;
    self.timestmap = [NSDate date].timeIntervalSince1970;
    
    if(self.score > self.maxscore)
    {
        self.maxscore = self.score;
    }
    
    if(self.course.chapters.count > self.index)
    {
        mcourseitemchapter *nextchapter = self.course.chapters[self.index];
        
        if(!nextchapter.available)
        {
            [ctoast toast:@"shisus"];
//            [nextchapter open];
        }
    }
    
    [mdb updatechapter:self];
}

-(mchallenge*)challenge
{
    mchallenge *challenge = [self.strategy challenge];
    challenge.chapter = self;
    self.currentchallenge++;
    
    return challenge;
}

-(void)success:(NSUInteger)score
{
    self.score += score;
    self.passedchallenges++;
}

@end