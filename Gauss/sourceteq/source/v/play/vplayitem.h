#import "appdel.h"
#import "viewbase.h"

@class vplayitembar;
@class vplayitemchallenge;

@interface vplayitem:viewbase

@property(weak, nonatomic)vplayitembar *bar;
@property(weak, nonatomic)vplayitemchallenge *challenge;

@end