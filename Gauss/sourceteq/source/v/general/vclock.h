#import "appdel.h"

@class timerbg;

@interface vclock:UIView<timerbgdel>

@property(strong, nonatomic)timerbg *timer;
@property(nonatomic)NSUInteger size;

@end