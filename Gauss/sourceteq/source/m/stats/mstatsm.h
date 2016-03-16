#import "appdel.h"

@class mstatsitem;

@interface mstatsm:NSObject

-(void)refresh;

@property(strong, nonatomic)NSArray<mstatsitem*> *items;

@end