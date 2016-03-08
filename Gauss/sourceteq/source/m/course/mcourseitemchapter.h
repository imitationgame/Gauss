#import <UIKit/UIKit.h>

@class mcourseitem;
@class scourse;
@class mchallenge;

@interface mcourseitemchapter:NSObject

-(void)open;
-(BOOL)keepplaying;
-(mchallenge*)challenge;
-(void)success:(NSUInteger)score;

@property(weak, nonatomic)mcourseitem *course;
@property(strong, nonatomic)scourse *strategy;
@property(copy, nonatomic)NSString *uniqueid;
@property(nonatomic)NSUInteger dbid;
@property(nonatomic)NSUInteger timestmap;
@property(nonatomic)NSUInteger totalchallenges;
@property(nonatomic)NSUInteger currentchallenge;
@property(nonatomic)NSUInteger passedchallenges;
@property(nonatomic)NSUInteger extratime;
@property(nonatomic)NSUInteger score;
@property(nonatomic)NSUInteger index;
@property(nonatomic)BOOL available;

@end