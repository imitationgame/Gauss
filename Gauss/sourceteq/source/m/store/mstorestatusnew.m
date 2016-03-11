#import "mstorestatusnew.h"

@implementation mstorestatusnew

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"purchase_status_new", nil);
    
    return self;
}

#pragma mark -
#pragma mark status cell

-(void)config:(vstorecell*)cell
{
    [cell.button setHidden:NO];
    [cell.statuslabel setHidden:NO];
    [cell.statuslabel setText:self.name];
    [cell.statusicon setHidden:YES];
}

@end