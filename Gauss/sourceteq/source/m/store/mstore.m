#import "mstore.h"

@implementation mstore

+(void)purchase:(SKProduct*)product
{
    SKPayment *payment = [SKMutablePayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
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

-(void)checkavailabilities
{
    self.error = nil;
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:self.purchases.asset];
    request.delegate = self;
    [request start];
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