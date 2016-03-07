#import "appdel.h"

@class mchallengetime;
@class mchallengeoperand;
@class moperation;

@interface mchallenge:NSObject

@property(strong, nonatomic)mchallengetime *time;
@property(strong, nonatomic)NSArray<mchallengeoperand*> *operands;
@property(strong, nonatomic)NSArray<moperation*> *operations;
@property(strong, nonatomic)mchallengeoperand *result;

@end