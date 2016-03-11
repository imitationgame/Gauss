#import "mstorepurchasesitem.h"

@implementation mstorepurchasesitem

-(void)purchase
{
    [[mstore singleton] purchase:self.skproduct];
}

@end