#import "appdel.h"

@class mplayfinishcell;
@class mcourseitemchapter;

@interface mplayfinish:NSObject

-(instancetype)init:(mcourseitemchapter*)chapter;

@property(weak, nonatomic)mcourseitemchapter *chapter;
@property(strong, nonatomic)NSMutableArray<mplayitemcell*> *cells;

@end