#import "appdel.h"
#import "viewbase.h"

@class vstatsbar;

@interface vstats:viewbase

@property(weak, nonatomic)vstatsbar *bar;
@property(weak, nonatomic)NSLayoutConstraint *layoutbarheight;

@end