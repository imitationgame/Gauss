#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE item (id INTEGER PRIMARY KEY, created INTEGER);";
    
    [dbcon query:query];
    [dbcon commit];
}

@end