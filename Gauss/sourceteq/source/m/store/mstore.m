#import "mstore.h"

@implementation mstore

+(instancetype)singleton
{
    static mstore *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

@end