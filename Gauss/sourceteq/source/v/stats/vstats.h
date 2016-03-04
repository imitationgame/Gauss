#import "appdel.h"
#import "viewbase.h"

@class vstatsrocket;

@interface vstats:viewbase

@property(weak, nonatomic)vstatsrocket *rocket;
@property(weak, nonatomic)NSLayoutConstraint *consrocketleft;

@end