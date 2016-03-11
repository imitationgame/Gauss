#import "mstorepurchases.h"

@implementation mstorepurchases

-(instancetype)init
{
    self = [super init];
    
    self.priceformater = [[NSNumberFormatter alloc] init];
    [self.priceformater setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    self.items = [NSMutableArray array];
    
    NSArray *rawitems = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"purchases" withExtension:@"plist"]];
    NSUInteger qtyitems = rawitems.count;
    
    for(NSUInteger i = 0; i < qtyitems; i++)
    {
        NSDictionary *rawitem = rawitems[i];
        NSMutableDictionary *perkdict = [NSMutableDictionary dictionary];
        NSString *perkid = rawperk[@"id"];
        
        if(!totalperks[perkid])
        {
            perkschanged = YES;
            perkdict[@"title"] = rawperk[@"title"];
            perkdict[@"descr"] = rawperk[@"descr"];
            perkdict[@"status"] = @(perkstatusnew);
            totalperks[perkid] = perkdict;
        }
    }
    
    
    array = [NSMutableArray array];
    
    NSDictionary *perks = [modsettings sha].perks;
    NSArray *keys = perks.allKeys;
    NSInteger qty = keys.count;
    
    for(NSInteger i = 0; i < qty; i++)
    {
        NSString *key = keys[i];
        NSDictionary *value = perks[key];
        NSString *title = value[@"title"];
        NSString *descr = value[@"descr"];
        perkstatus status = (perkstatus)[value[@"status"] integerValue];
        
        modperkelement *element = [[modperkelement alloc] init];
        element.prodid = key;
        element.title = title;
        element.descr = descr;
        element.status = status;
        [array addObject:element];
    }
    
    return self;
}

#pragma mark public

-(NSSet*)asaset
{
    
}

@end