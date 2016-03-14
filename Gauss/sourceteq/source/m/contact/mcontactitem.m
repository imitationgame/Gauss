#import "mcontactitem.h"

@implementation mcontactitem

-(instancetype)init
{
    self = [super init];
    self.reusableid = NSStringFromClass([self class]);
    
    return self;
}

@end