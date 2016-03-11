#import "mstorestatusnotsupported.h"

@implementation mstorestatusnotsupported

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"purchase_status_notsupported", nil);
    
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