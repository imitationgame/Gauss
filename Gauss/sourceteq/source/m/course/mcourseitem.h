#import <UIKit/UIKit.h>

@class mcourseitemchapter;

@interface mcourseitem:NSObject

-(void)open;
-(void)add:(mcourseitemchapter*)chapter;

@property(copy, nonatomic)NSString *uniqueid;
@property(copy, nonatomic)NSString *name;
@property(strong, nonatomic)NSMutableArray<mcourseitemchapter*> *chapters;
@property(nonatomic)NSUInteger dbid;
@property(nonatomic)BOOL available;

@end