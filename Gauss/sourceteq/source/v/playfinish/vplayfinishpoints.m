#import "vplayfinishpoints.h"

static NSString* const pointcellid = @"cellid";
static NSUInteger const marginvr = 50;
static NSUInteger const cellheight = 50;

@implementation vplayfinishpoints

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(marginvr, 0, marginvr, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] init];
    [collection setClipsToBounds:YES];
    [collection setUserInteractionEnabled:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vplayfinishpointscell class] forCellWithReuseIdentifier:pointcellid];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width, cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSInteger count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vplayfinishpointscell *cell = [col dequeueReusableCellWithReuseIdentifier:pointcellid forIndexPath:index];
    
    return cell;
}

@end