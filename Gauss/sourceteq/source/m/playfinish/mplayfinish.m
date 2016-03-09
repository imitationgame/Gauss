#import "mplayfinish.h"

@implementation mplayfinish

-(instancetype)init:(mcourseitemchapter*)chapter
{
    self = [super init];

    self.chapter = chapter;
    self.cells = [NSMutableArray array];
    
    return self;
}

#pragma mark functionality

-(void)add:(mplayitemcell*)cell
{
    cell.
    [self.cells addObject:cell];
}

@end