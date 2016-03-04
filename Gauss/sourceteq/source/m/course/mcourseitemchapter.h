#import <UIKit/UIKit.h>

@class mcourseitem;

@interface mcourseitemchapter:NSObject

-(instancetype)init:(mcourseitem*)course;
-(void)open;

@property(weak, nonatomic)mcourseitem *course;
@property(copy, nonatomic)NSString *uniqueid;
@property(nonatomic)NSUInteger dbid;
@property(nonatomic)NSUInteger timestmap;
@property(nonatomic)NSUInteger score;
@property(nonatomic)BOOL available;

@end