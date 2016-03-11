#import "appdel.h"

@class mstorepurchasesitem;

@interface mstorepurchases:NSObject

@property(strong, nonatomic)NSMutableArray<mstorepurchasesitem*> *items;
@property(strong, nonatomic)NSNumberFormatter *priceformater;
@property(strong, nonatomic)NSSet *asset;

@end