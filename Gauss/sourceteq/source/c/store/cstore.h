#import "appdel.h"

@class mstorepurchases;

@interface cstore:UIViewController

+(void)show;
-(void)back;

@property(strong, nonatomic)mstorepurchases *purchases;

@end