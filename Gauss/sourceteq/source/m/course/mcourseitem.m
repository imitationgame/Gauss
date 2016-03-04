#import "mcourseitem.h"
#import "mdb.h"

@implementation mcourseitem

-(instancetype)init
{
    self = [super init];
    self.uniqueid = NSStringFromClass([self class]);
    self.dbid = 0;
    self.available = NO;
    
    return self;
}

#pragma mark public

-(void)open
{
    self.available = YES;
    [mdb opencourse:self.dbid];
}

@end