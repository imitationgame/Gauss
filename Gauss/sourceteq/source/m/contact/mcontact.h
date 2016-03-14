#import "appdel.h"

@class mcontactitem;

@interface mcontact:NSObject

@property(strong, nonatomic)NSArray<mcontactitem*> *items;

@end