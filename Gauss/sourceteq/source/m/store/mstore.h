#import "appdel.h"

@class mstorepurchases;

@interface mstore:NSObject<SKProductsRequestDelegate, SKPaymentTransactionObserver, SKRequestDelegate>

+(instancetype)singleton;
-(void)checkavailabilities:(mstorepurchases*)purchases;
-(void)purchase:(SKProduct*)product;
-(void)restorepurchases;

@property(weak, nonatomic)mstorepurchases *purchases;
@property(strong, nonatomic)NSNotification *notification;
@property(copy, nonatomic)NSString *error;

@end