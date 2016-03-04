#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE course (id INTEGER PRIMARY KEY, available INTEGER, uniqueid TEXT COLLATE NOCASE);";
    
    [dbcon query:query];
    
    query = @"CREATE TABLE chapter (id INTEGER PRIMARY KEY, );";
    
    [dbcon commit];
}

@end