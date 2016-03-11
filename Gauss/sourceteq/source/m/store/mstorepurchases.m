#import "mstorepurchases.h"

@implementation mstorepurchases

-(instancetype)init
{
    self = [super init];
    
    self.priceformater = [[NSNumberFormatter alloc] init];
    [self.priceformater setNumberStyle:NSNumberFormatterCurrencyStyle];
    self.items = [NSMutableArray array];
    self.asset = [NSMutableSet set];
    
    NSArray *rawitems = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"purchases" withExtension:@"plist"]];
    NSUInteger qtyitems = rawitems.count;
    
    for(NSUInteger i = 0; i < qtyitems; i++)
    {
        NSDictionary *rawitem = rawitems[i];
        NSString *itemid = rawitem[@"id"];
        NSString *itemtitle = rawitem[@"title"];
        NSString *itemdescr = rawitem[@"descr"];
        
        mstorepurchasesitem *item = [[mstorepurchasesitem alloc] init];
        item.itemid = itemid;
        item.itemtitle = itemtitle;
        item.itemdescr = itemdescr;
        item.status = [[mstorestatusnew alloc] init];
        
        [self.asset addObject:itemid];
    }
    
    return self;
}

#pragma mark public

-(void)loadskproduct:(SKProduct*)skproduct
{
    NSString *prodid = skproduct.productIdentifier;
    NSInteger qty = self.items.count;
    
    for(NSUInteger i = 0; i < qty; i++)
    {
        mstorepurchasesitem *initem = self.items[i];
        
        if([initem.itemid isEqualToString:prodid])
        {
            NSLog(@"purchase: %@", prodid);
            
            [self.priceformater setLocale:skproduct.priceLocale];
            NSString *strprice = [self.priceformater stringFromNumber:skproduct.price];
            initem.pricestring = strprice;
            initem.skproduct = skproduct;
            
            break;
        }
    }
}

@end