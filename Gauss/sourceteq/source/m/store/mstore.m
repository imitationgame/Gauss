#import "mstore.h"

@implementation mstore

+(instancetype)singleton
{
    static mstore *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    
    self.notification = [NSNotification notificationWithName:notpurchaseupd object:nil];
    
    return self;
}

#pragma mark functionality

-(void)sendnotification
{
    [[NSNotificationCenter defaultCenter] postNotification:self.notification];
}

#pragma mark public

-(void)checkavailabilities:(mstorepurchases*)purchases
{
    self.purchases = purchases;
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:purchases.asset];
    request.delegate = self;
    [request start];
}

-(void)purchase:(SKProduct*)product
{
    [self sendnotification];
    SKPayment *payment = [SKMutablePayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

-(void)restorepurchases
{
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

#pragma mark -
#pragma mark sk del

-(void)request:(SKRequest*)request didFailWithError:(NSError*)error
{
    self.error = NSLocalizedString(@"error_connectionfailed", nil);
    [self sendnotification];
}

-(void)productsRequest:(SKProductsRequest*)request didReceiveResponse:(SKProductsResponse*)response
{
    NSArray *products = response.products;
    NSInteger qty = products.count;
    
    for(NSUInteger i = 0; i < qty; i++)
    {
        SKProduct *skproduct = products[i];
        [self.purchases loadskproduct:skproduct];
    }
    
    [self restorepurchases];
}

-(void)paymentQueue:(SKPaymentQueue*)queue updatedTransactions:(NSArray*)transactions
{
    [self.purchases updatetransactions:transactions];
    [self sendnotification];
}

-(void)paymentQueue:(SKPaymentQueue*)queue removedTransactions:(NSArray*)transactions
{
    [self.purchases updatetransactions:transactions];
    [self sendnotification];
}

-(void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue*)queue
{
    [self sendnotification];
}

-(void)paymentQueue:(SKPaymentQueue*)queue restoreCompletedTransactionsFailedWithError:(NSError*)error
{
    self.error = error.localizedDescription;
    [self sendnotification];
}

@end