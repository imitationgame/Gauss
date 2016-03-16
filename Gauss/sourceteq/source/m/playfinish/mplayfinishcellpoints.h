#import "appdel.h"
#import "mplayfinishcell.h"

@class mplayfinishcellpointscell;

@interface mplayfinishcellpoints:mplayfinishcell

@property(strong, nonatomic)NSArray<mplayfinishcellpointscell*> *cells;
@property(nonatomic)NSUInteger marginvr;
@property(nonatomic)NSUInteger incellheight;

@end