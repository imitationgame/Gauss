#import <UIKit/UIKit.h>

@interface mcontactitem:NSObject

@property(copy, nonatomic)NSString *reusableid;
@property(nonatomic)Class cellclass;
@property(nonatomic)CGFloat cellheight;

@end