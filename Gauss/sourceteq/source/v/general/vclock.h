#import "appdel.h"
#import "vclockprotocol.h"

@class timerbg;

@interface vclock:UIView<timerbgdel>

-(instancetype)init:(id<vclockprotocol>)delegate;

@property(weak, nonatomic)id<vclockprotocol> delegate;
@property(strong, nonatomic)timerbg *timer;
@property(nonatomic)NSUInteger size;

@end