#import "mstorepurchases.h"

@implementation mstorepurchases

-(instancetype)init
{
    self = [super init];
    
    self.priceformater = [[NSNumberFormatter alloc] init];
    [self.priceformater setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    return self;
}

@end