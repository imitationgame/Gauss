#import "mcourseitemmult.h"

@implementation mcourseitemmult

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"course_mult_name", nil);
    
    [self add:[[mcoursemult1 alloc] init]];
    [self add:[[mcoursemult2 alloc] init]];
    [self add:[[mcoursemult3 alloc] init]];
    [self add:[[mcoursemult4 alloc] init]];
    [self add:[[mcoursemult5 alloc] init]];
    [self add:[[mcoursemult6 alloc] init]];
    
    return self;
}

@end