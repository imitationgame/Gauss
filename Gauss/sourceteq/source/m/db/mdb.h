#import "appdel.h"

@class mdbitem;

@interface mdb:NSObject

+(void)updatedb;
+(void)loadcourses;
+(void)opencourse:(NSUInteger)dbid;
+(void)openchapter:(NSUInteger)dbid;

@end