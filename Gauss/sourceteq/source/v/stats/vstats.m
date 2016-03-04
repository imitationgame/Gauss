#import "vstats.h"

static NSString* const coursehaderid = @"course";
static NSString* const chaptercellid = @"chapter";
static NSUInteger const barmaxheight = 65;
static NSUInteger const infomaxheight = 250;
static NSUInteger const headerheight = 40;
static NSUInteger const cellheight = 60;
static NSUInteger const linespacing = 2;
static NSUInteger const footerspacing = 30;

@implementation vstats

-(instancetype)init:(cstats*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colorsecond];

    vstatsbar *bar = [[vstatsbar alloc] init];
    self.bar = bar;
    
    vstatsinfo *info = [[vstatsinfo alloc] init];
    self.info = info;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:linespacing];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(linespacing, 0, footerspacing, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection registerClass:[vstatsheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:coursehaderid];
    [collection registerClass:[vstatscell class] forCellWithReuseIdentifier:chaptercellid];
    
    self.collection = collection;
    
    [self addSubview:info];
    [self addSubview:collection];
    [self addSubview:bar];
    
    NSDictionary *views = @{@"bar":bar, @"info":info};
    NSDictionary *metrics = @{};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:barmaxheight];
    self.layoutinfoheight = [NSLayoutConstraint constraintWithItem:info attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:infomaxheight];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[info]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[info]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = CGSizeMake(col.bounds.size.width, headerheight);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width, cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSUInteger sections = [[mcourse singleton] count];
    
    return sections;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger items = [[mcourse singleton] course:section].chapters.count;
    
    return items;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vstatsheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:coursehaderid forIndexPath:index];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vstatscell *cell = [col dequeueReusableCellWithReuseIdentifier:chaptercellid forIndexPath:index];
    
    return cell;
}

@end