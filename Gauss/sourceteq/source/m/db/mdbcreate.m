#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE course (id INTEGER PRIMARY KEY, available INTEGER, uniqueid TEXT COLLATE NOCASE);";
    [dbcon query:query];
    
    query = @"CREATE TABLE chapter (id INTEGER PRIMARY KEY, uniqueid TEXT COLLATE NOCASE, timestamp INTEGER, score INTEGER);";
    [dbcon query:query];
    
    [mdbcreate addcourse:dbcon class:[mcourseitemadd class] available:YES];
    [mdbcreate addcourse:dbcon class:[mcourseitemsubs class] available:NO];
    
    [mdbcreate addchapter:dbcon class:[mcourseadd1 class]];
    [mdbcreate addchapter:dbcon class:[mcourseadd2 class]];
    [mdbcreate addchapter:dbcon class:[mcoursesubs1 class]];
    [mdbcreate addchapter:dbcon class:[mcoursesubs2 class]];
    
    [dbcon commit];
    
    NSLog(@"%@", [db rows:@"select * from course;"]);
    NSLog(@"%@", [db rows:@"select * from chapter;"]);
}

+(void)addcourse:(db*)dbcon class:(Class)class available:(BOOL)available
{
    NSString *uniqueid = NSStringFromClass(class);
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO course "
                       "(available, uniqueid) "
                       "values(%@, \"%@\");",
                       @(available), uniqueid];
    
    [dbcon query:query];
}

+(void)addchapter:(db*)dbcon class:(Class)class
{
    NSString *uniqueid = NSStringFromClass(class);
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO chapter "
                       "(uniqueid, timestamp, score) "
                       "values(\"%@\", 0, 0);",
                       uniqueid];
    
    [dbcon query:query];
}

@end