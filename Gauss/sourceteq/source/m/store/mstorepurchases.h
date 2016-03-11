#import "appdel.h"

@class mstorepurchasesitem;

@interface mstorepurchases:NSObject

-(void)loadskproduct:(SKProduct*)skproduct;

@property(strong, nonatomic)NSMutableArray<mstorepurchasesitem*> *items;
@property(strong, nonatomic)NSNumberFormatter *priceformater;
@property(strong, nonatomic)NSMutableSet *asset;

@end