#import <UIKit/UIKit.h>

@class mcourseitem;
@class scourse;

@interface mcourseitemchapter:NSObject

-(instancetype)init:(mcourseitem*)course;
-(void)open;

@property(weak, nonatomic)mcourseitem *course;
@property(strong, nonatomic)scourse *strategy;
@property(copy, nonatomic)NSString *uniqueid;
@property(nonatomic)NSUInteger dbid;
@property(nonatomic)NSUInteger timestmap;
@property(nonatomic)NSUInteger totalchallenges;
@property(nonatomic)NSUInteger currentchallenge;
@property(nonatomic)NSUInteger extratime;
@property(nonatomic)NSUInteger score;
@property(nonatomic)BOOL available;

@end