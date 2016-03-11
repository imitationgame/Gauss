#import "mstorepurchasesitem.h"

@implementation mstorepurchasesitem

-(NSString*)description
{
    NSMutableString *string = [NSMutableString string];
    [string appendString:self.itemtitle];
    [string appendFormat:@":%@", self.itemdescr];
    [string appendFormat:@":%@", self.pricestring];
    [string appendFormat:@":%@", self.status.name];
    
    return string;
}

#pragma mark public

-(void)purchase
{
    [[mstore singleton] purchase:self.skproduct];
}

@end