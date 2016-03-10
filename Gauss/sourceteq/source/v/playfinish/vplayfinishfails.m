#import "vplayfinishfails.h"

static CGFloat const delta = 0.02;
static NSUInteger const margin = 100;

@implementation vplayfinishfails
{
    NSTimer *timer;
    CGFloat current;
    CGFloat width;
    CGFloat height;
    CGFloat width_2;
    CGFloat height_2;
    CGFloat size;
    CGFloat radius;
    CGFloat radius_m;
    BOOL first;
}

-(instancetype)init:(CGFloat)breakpoint
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.breackpoint = breakpoint;
    first = YES;
    current = 0;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    return self;
}

-(void)dealloc
{
    [timer invalidate];
}

-(void)drawRect:(CGRect)rect
{
    if(first)
    {
        first = NO;
        width = rect.size.width;
        height = rect.size.height;
        width_2 = width / 2.0;
        height_2 = height / 2.0;
        size = MIN(width, height);
        radius = size / 2.0;
        radius_m = radius - margin;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, colorsecond.CGColor);
    CGContextAddArc(context, width_2, height_2, radius_m, 0.0001, 0, 0);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextSetFillColorWithColor(context, colormain.CGColor);
    CGContextMoveToPoint(context, width_2, height_2);
    CGContextAddArc(context, width_2, height_2, radius_m, 0.0001, current, 0);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFill);
    
}

-(void)tick
{
    if(current < self.breackpoint)
    {
        current += delta;
        [self setNeedsDisplay];
    }
    else
    {
        [timer invalidate];
    }
}

@end