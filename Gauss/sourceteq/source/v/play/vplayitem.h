#import "appdel.h"
#import "viewbase.h"

@class vplayitembar;
@class vplayitemchallenge;
@class vplayitemcontrols;
@class vplayitemloader;

@interface vplayitem:viewbase

@property(weak, nonatomic)vplayitembar *bar;
@property(weak, nonatomic)vplayitemchallenge *challenge;
@property(weak, nonatomic)vplayitemcontrols *controls;
@property(weak, nonatomic)vplayitemloader *loader;
@property(weak, nonatomic)NSLayoutConstraint *layoutcontrolsbottom;

@end