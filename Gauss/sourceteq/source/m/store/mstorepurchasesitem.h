#import "appdel.h"

@interface mstorepurchasesitem:NSObject

@property(strong, nonatomic)SKProduct *skproduct;
@property(copy, nonatomic)NSString *prodid;
@property(copy, nonatomic)NSString *title;
@property(copy, nonatomic)NSString *descr;
@property(copy, nonatomic)NSString *pricestr;
@property(nonatomic)perkstatus status;

@end