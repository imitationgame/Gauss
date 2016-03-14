#import "mstorestatuspurchasing.h"

@implementation mstorestatuspurchasing

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"purchase_status_purchasing", nil);
    
    return self;
}

#pragma mark -
#pragma mark status cell

-(void)config:(vstorecell*)cell
{
    [cell.button setHidden:YES];
    [cell.statuslabel setHidden:NO];
    [cell.statuslabel setText:self.name];
    [cell.statusicon setHidden:YES];
}

@end