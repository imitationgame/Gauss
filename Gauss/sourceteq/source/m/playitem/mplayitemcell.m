#import "mplayitemcell.h"

@implementation mplayitemcell

-(instancetype)init:(id)model
{
    self = [super init];
    
    self.model = model;
    self.cellid = NSStringFromClass([self class]);
    self.width = 100;
    
    return self;
}

@end