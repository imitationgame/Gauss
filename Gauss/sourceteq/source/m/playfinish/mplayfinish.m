#import "mplayfinish.h"

@implementation mplayfinish

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init];

    self.cells = @[
                   [[mplayfinishcellgeneral alloc] init:chapter],
                   [[mplayfinishcellchapters alloc] init:chapter],
                   [[mplayfinishcellfails alloc] init:chapter],
                   [[mplayfinishcellpoints alloc] init:chapter]
                   ];
    
    return self;
}

@end