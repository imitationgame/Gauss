#import "appdel.h"
#import "viewbase.h"

@class vplayitembar;
@class vplayitemchallenge;
@class vplayitemcontrols;

@interface vplayitem:viewbase

@property(weak, nonatomic)vplayitembar *bar;
@property(weak, nonatomic)vplayitemchallenge *challenge;
@property(weak, nonatomic)vplayitemcontrols *controls;

@end