#import "appdel.h"

@class mplayfinishcell;
@class mcourseitemchapter;

@interface mplayfinish:NSObject

-(instancetype)init:(mcourseitemchapter*)chapter;

@property(strong, nonatomic)NSArray<mplayfinishcell*> *cells;

@end