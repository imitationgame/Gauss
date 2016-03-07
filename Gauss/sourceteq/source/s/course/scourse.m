#import "scourse.h"

@implementation scourse

-(instancetype)init
{
    self = [super init];
    self.minnumber = 0;
    self.maxnumber = 9;
    self.maxoperands = 2;
    self.decimals = NO;
    
    return self;
}

@end