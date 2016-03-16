#import "appdel.h"

@class mcourseitemchapter;
@class mchallengetime;
@class mchallengeoperand;
@class moperation;

@interface mchallenge:NSObject

@property(weak, nonatomic)mcourseitemchapter *chapter;
@property(strong, nonatomic)mchallengetime *time;
@property(strong, nonatomic)NSArray<mchallengeoperand*> *operands;
@property(strong, nonatomic)NSArray<moperation*> *operations;
@property(strong, nonatomic)mchallengeoperand *result;
@property(weak, nonatomic)mchallengeoperand *trivia;

@end