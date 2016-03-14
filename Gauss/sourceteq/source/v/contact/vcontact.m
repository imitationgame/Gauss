#import "vcontact.h"

static NSUInteger const headermaxheight = 300;

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
    
    [self addSubview:header];
    
    NSDictionary *views = @{@"header":header};
    NSDictionary *metrics = @{};
    
    self.layoutheaderheight = [NSLayoutConstraint constraintWithItem:header attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:headermaxheight];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[header]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutheaderheight];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    UICollectionViewCell *cell;
    
    return cell;
}

@end