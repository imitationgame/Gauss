#import "mplayitemcell.h"

@implementation mplayitemcell

-(instancetype)init
{
    self = [super init];
    
    self.cellid = NSStringFromClass([self class]);
    
    return self;
}

@end