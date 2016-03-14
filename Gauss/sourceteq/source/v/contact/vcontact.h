#import "appdel.h"
#import "viewbase.h"

@class vcontactheader;

@interface vcontact:viewbase<UIScrollViewDelegate>

@property(weak, nonatomic)vcontactheader *header;
@property(weak, nonatomic)NSLayoutConstraint *layoutheaderheight;
@property(weak, nonatomic)NSLayoutConstraint *layoutheadertop;
@property(weak, nonatomic)UIScrollView *scroll;

@end