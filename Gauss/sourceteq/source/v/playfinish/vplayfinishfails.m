#import "vplayfinishfails.h"

static NSUInteger const margin = 20;

@implementation vplayfinishfails

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat width_2 = width / 2.0;
    CGFloat height_2 = height / 2.0;
    CGFloat size = MIN(width, height);
    CGFloat radius = size / 2.0;
    CGFloat radius_m = radius - margin;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, colorsecond.CGColor);
    CGContextAddArc(context, width_2, height_2, radius_m, 0.0001, 0, 0);
    CGContextDrawPath(context, kCGPathFill);
}

@end