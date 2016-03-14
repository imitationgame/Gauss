#import "appdel.h"

@class mcontactrateitem;

@interface mcontactrate:NSObject

-(void)selectstar:(NSUInteger)index;

@property(strong, nonatomic)NSMutableArray<mcontactrateitem*> *stars;

@end