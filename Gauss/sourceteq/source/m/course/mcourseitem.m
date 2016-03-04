#import "mcourseitem.h"

@implementation mcourseitem

-(instancetype)init
{
    self = [super init];
    self.uniqueid = NSStringFromClass([self class]);
    self.available = NO;
    
    return self;
}

@end