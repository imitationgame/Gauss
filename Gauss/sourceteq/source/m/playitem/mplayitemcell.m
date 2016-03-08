#import "mplayitemcell.h"

@implementation mplayitemcell

-(instancetype)init:(id)model
{
    self = [super init];
    
    self.model = model;
    self.cellid = NSStringFromClass([self class]);
    
    return self;
}

@end