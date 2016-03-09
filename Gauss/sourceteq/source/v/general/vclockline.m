#import "vclockline.h"

static CGFloat const linewidth = 8;
static CGFloat const linerad = 0.025;

@implementation vclockline

-(instancetype)init:(CGFloat)degree
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    self.degree = degree;
    
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGFloat width = rect.size.width;
    CGFloat width_2 = width / 2.0;
    CGFloat linelenght = width_2 - linewidth;
    CGFloat endingdegree = self.degree + linerad;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, colormain.CGColor);
    CGContextSetLineWidth(context, linewidth);
    CGContextAddArc(context, width_2, width_2, linelenght, self.degree, endingdegree, 0);
    CGContextDrawPath(context, kCGPathStroke);
}

@end