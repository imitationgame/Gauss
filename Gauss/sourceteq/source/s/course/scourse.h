#import <UIKit/UIKit.h>

@class moperation;
@class mchallenge;

@interface scourse:NSObject

-(mchallenge*)challenge;
-(void)make:(mchallenge*)challenge;

@property(strong, nonatomic)NSArray<moperation*> *operations;
@property(nonatomic)NSInteger minnumber;
@property(nonatomic)NSInteger maxnumber;
@property(nonatomic)NSUInteger maxoperands;
@property(nonatomic)NSUInteger timeout;
@property(nonatomic)BOOL decimals;

@end