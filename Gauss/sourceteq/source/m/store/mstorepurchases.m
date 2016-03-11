#import "mstorepurchases.h"

static NSUInteger const itemtitlesize = 18;
static NSUInteger const itemdescrsize = 18;
static NSUInteger const itempricesize = 16;

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
        
        [self.items addObject:item];
        [self.asset addObject:itemid];
    }
    
    return self;
}

#pragma mark public

-(void)loadskproduct:(SKProduct*)skproduct
{
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:itemtitlesize], NSForegroundColorAttributeName:colormain};
    NSDictionary *dictdescr = @{NSFontAttributeName:[UIFont fontWithName:fontregularname size:itemdescrsize], NSForegroundColorAttributeName:colorthird};
    NSDictionary *dictprice = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:itempricesize], NSForegroundColorAttributeName:[UIColor blackColor]};
    
    NSString *prodid = skproduct.productIdentifier;
    NSInteger qty = self.items.count;
    
    for(NSUInteger i = 0; i < qty; i++)
    {
        mstorepurchasesitem *initem = self.items[i];
        
        if([initem.itemid isEqualToString:prodid])
        {
            [self.priceformater setLocale:skproduct.priceLocale];
            NSString *strprice = [self.priceformater stringFromNumber:skproduct.price];
            initem.pricestring = strprice;
            initem.skproduct = skproduct;
 
            NSString *stringtitle = initem.itemtitle;
            NSString *stringdescr = [NSString stringWithFormat:@"\n%@", initem.itemdescr];
            NSString *stringprice = [NSString stringWithFormat:@"\n%@", strprice];
            
            NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dicttitle];
            NSAttributedString *attrdescr = [[NSAttributedString alloc] initWithString:stringdescr attributes:dictdescr];
            NSAttributedString *attrprice = [[NSAttributedString alloc] initWithString:stringprice attributes:dictprice];
            
            NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
            [mut appendAttributedString:attrtitle];
            [mut appendAttributedString:attrdescr];
            [mut appendAttributedString:attrprice];
            initem.attributestring = mut;
            
            break;
        }
    }
}

@end