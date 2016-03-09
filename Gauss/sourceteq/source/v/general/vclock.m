#import "vclock.h"

static CGFloat const clockdelta = 0.0698132;
static NSUInteger const clocksize = 120;

@implementation vclock
{
    CGFloat currentdegree;
    NSUInteger counter;
}

-(instancetype)init:(id<vclockprotocol>)delegate
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.size = clocksize;
    self.delegate = delegate;
    
    currentdegree = -M_PI_2;
    counter = 0;
    self.timer = [timerbg millis:20 delegate:self background:NO];
    [self.timer resume];
    
    return self;
}

-(void)dealloc
{
    [self.timer pause];
}

-(CGSize)intrinsicContentSize
{
    CGSize size = CGSizeMake(clocksize, clocksize);
    
    return size;
}

#pragma mark functionality

-(void)addline
{
    vclockline *line = [[vclockline alloc] init:currentdegree];
    
    [self addSubview:line];
    
    NSDictionary *views = @{@"line":line};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[line]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[line]-0-|" options:0 metrics:metrics views:views]];
}

#pragma mark -
#pragma mark timer del

-(void)timerbgtick
{
    counter++;
    currentdegree += clockdelta;
    
    if(counter >= 90)
    {
        [self.timer pause];
        self.timer = nil;
        [self.delegate clockdone];
    }
    else
    {
        [self addline];
    }
}

@end