#import <UIKit/UIKit.h>

@interface mplayitemcell:NSObject

-(instancetype)init:(id)model;
-(void)configure:(UICollectionViewCell*)cell;

@property(weak, nonatomic)id model;
@property(copy, nonatomic)NSString *cellid;
@property(nonatomic)NSUInteger width;
@property(nonatomic)Class cellclass;

@end