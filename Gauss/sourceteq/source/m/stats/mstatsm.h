#import "appdel.h"

@class mstatsitem;

@interface mstatsm:NSObject

-(void)refresh;

@property(strong, nonatomic)NSMutableArray<mstatsitem*> *items;

@end