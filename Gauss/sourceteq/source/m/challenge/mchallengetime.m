#import "mchallengetime.h"

@implementation mchallengetime

-(instancetype)init:(NSUInteger)limit
{
    self = [super init];
    self.limit = limit;
    
    return self;
}

@end