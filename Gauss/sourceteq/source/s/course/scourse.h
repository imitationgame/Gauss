#import <UIKit/UIKit.h>

@class moperation;

@interface scourse:NSObject

@property(strong, nonatomic)NSArray<moperation*> *operations;
@property(nonatomic)NSInteger minnumber;
@property(nonatomic)NSInteger maxnumber;
@property(nonatomic)NSUInteger maxoperands;
@property(nonatomic)BOOL decimals;

@end