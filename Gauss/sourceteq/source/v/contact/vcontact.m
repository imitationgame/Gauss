#import "vcontact.h"

static NSUInteger const headermaxheight = 200;
static NSUInteger const headerminheight = 150;

@interface vcontact ()

@property(weak, nonatomic)ccontact *controller;

@end

@implementation vcontact

@dynamic controller;

-(instancetype)init:(ccontact*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    vcontactheader *header = [[vcontactheader alloc] init:controller];
    self.header = header;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    self.collection = collection;
    
    [self addSubview:header];
    [self addSubview:scroll];
    
    NSDictionary *views = @{@"header":header, @"scroll":scroll};
    NSDictionary *metrics = @{};
    
    self.layoutheaderheight = [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:headermaxheight];
    self.layoutheadertop = [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[header]-0-[scroll]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutheaderheight];
    [self addConstraint:self.layoutheadertop];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat width = self.bounds.size.width;
    CGSize size = CGSizeMake(width, scrollcontentheight);
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.scroll setContentSize:size];
                   });
    
    [super layoutSubviews];
}

#pragma mark -
#pragma mark scroll del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offsety = scroll.contentOffset.y;
    CGFloat firedelta = fabs(offsety) / 2.0;
    CGFloat newheaderheight = headermaxheight - offsety;
    CGFloat newheadertop = 0;
    CGFloat newfireheight = self.header.fireinitialheight + firedelta;
    CGFloat newrocketbottom = self.header.fireinitialheight + (firedelta / 2);
    CGFloat firealpha = fabs(offsety) / 100.0;
    
    if(firealpha > 1)
    {
        firealpha = 1;
    }
    
    if(newheaderheight < headerminheight)
    {
        CGFloat delta = headerminheight - newheaderheight;
        newheaderheight = headerminheight;
        newheadertop = -delta;
    }
    
    self.layoutheaderheight.constant = newheaderheight;
    self.layoutheadertop.constant = newheadertop;
    self.header.layoutfireheight.constant = newfireheight;
    self.header.layoutrocketbottom.constant = -newrocketbottom;
    [self.header.imagefire setAlpha:firealpha];
}

@end