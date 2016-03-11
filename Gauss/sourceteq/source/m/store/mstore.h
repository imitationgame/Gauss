#import "appdel.h"

@interface mstore:NSObject<SKProductsRequestDelegate, SKPaymentTransactionObserver, SKRequestDelegate>

+(instancetype)singleton;

@property(strong, nonatomic)NSNotification *notification;
@property(copy, nonatomic)NSString *error;

@end