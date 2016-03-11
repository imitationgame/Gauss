#import "appdel.h"

@interface mstorepurchases:NSObject

@property(strong, nonatomic)NSMutableArray<mstorepurchasesitem*> *items;
@property(strong, nonatomic)NSNumberFormatter *priceformater;

@end