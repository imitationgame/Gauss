#import "mdb.h"

@implementation mdb

+(void)updatedb
{
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    NSDictionary *def = [tools defaultdict];
    
    NSString *dbfoldername = @"db";
    NSString *defdbname = def[@"dbname"];
    NSString *relative = [dbfoldername stringByAppendingPathComponent:defdbname];
    NSString *dbfolder = [documents stringByAppendingPathComponent:dbfoldername];
    [userdef setValue:relative forKey:@"dbname"];
    
    NSString *originaldb = [[NSBundle mainBundle] pathForResource:defdbname ofType:@""];
    dbname = [documents stringByAppendingPathComponent:relative];
    [mdirs createdir:[NSURL fileURLWithPath:dbfolder]];
    [mdirs copyfilefrom:originaldb to:dbname];
    
    [mdbcreate create];
}

+(void)loadcourses
{
    NSMutableArray *localcourses = [NSMutableArray array];
    NSMutableArray *localchapters = [NSMutableArray array];
    NSArray *rawcourses;
    NSArray *rawchapters;
    
    NSUInteger count = [mcourse singleton].courses.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mcourseitem *course = [mcourse singleton].courses[i];
        [localcourses addObject:course];
        [localchapters addObjectsFromArray:course.chapters];
    }
    
    db *dbcon = [db begin];
    NSString *query = @"SELECT id, available, uniqueid FROM course ORDER BY id ASC;";
    rawcourses = [dbcon rows:query];
    
    query = @"SELECT id, uniqueid, timestamp, score, available FROM chapter ORDER BY id ASC;";
    rawchapters = [dbcon rows:query];
    
    [dbcon commit];
    
    count = rawcourses.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawcourse = rawcourses[i];
        NSString *uniqueid = rawcourse[@"uniqueid"];
        NSUInteger dbid = [rawcourse[@"id"] unsignedIntegerValue];
        BOOL available = [rawcourse[@"available"] boolValue];
        NSUInteger countcourses = localcourses.count;
        
        for(NSUInteger j = 0; j < countcourses; j++)
        {
            mcourseitem *course = localcourses[j];
            
            if([course.uniqueid isEqualToString:uniqueid])
            {
                course.dbid = dbid;
                course.available = available;
                
                j = countcourses;
            }
        }
    }
    
    count = rawchapters.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawchapter = rawchapters[i];
        NSString *uniqueid = rawchapter[@"uniqueid"];
        NSUInteger dbid = [rawchapter[@"id"] unsignedIntegerValue];
        NSUInteger timestamp = [rawchapter[@"timestamp"] unsignedIntegerValue];
        NSUInteger score = [rawchapter[@"score"] unsignedIntegerValue];
        BOOL available = [rawchapter[@"available"] boolValue];
        NSUInteger countchapters = localcourses.count;
        
        for(NSUInteger j = 0; j < countchapters; j++)
        {
            mcourseitemchapter *chapter = localchapters[j];
            
            if([chapter.uniqueid isEqualToString:uniqueid])
            {
                chapter.dbid = dbid;
                chapter.timestmap = timestamp;
                chapter.score = score;
                chapter.available = available;
                
                j = countchapters;
            }
        }
    }
}

+(void)opencourse:(NSUInteger)dbid
{
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE course SET available=1 WHERE id=%@",
                       @(dbid)];
    [db query:query];
}

+(void)openchapter:(NSUInteger)dbid
{
    NSString *query = [NSString stringWithFormat:
                       @"UPDATE chapter SET available=1 WHERE id=%@",
                       @(dbid)];
    [db query:query];
}

@end