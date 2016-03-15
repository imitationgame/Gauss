#import "appdel.h"

@class mcourseitemchapter;

@interface mstatsitem:NSObject

-(instancetype)init:(mcourseitemchapter*)chapter;

@property(nonatomic)NSUInteger timestamp;

@end