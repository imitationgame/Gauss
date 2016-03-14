#import "vcontactrate.h"

static NSString* const ratecell = @"cellid";
static NSUInteger const colheight = 200;
static NSUInteger const cellwidth = 55;
static NSUInteger const starsnum = 5;

@implementation vcontactrate
{
    CGFloat cellshorizontal;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    cellshorizontal = cellwidth * starsnum;

    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setFont:[UIFont fontWithName:fontregularname size:18]];
    [label setTextColor:colorthird];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:NSLocalizedString(@"contact_rate_title", nil)];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setItemSize:CGSizeMake(cellwidth, colheight)];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vcontactratecell class] forCellWithReuseIdentifier:ratecell];
    [collection setAllowsSelection:YES];
    self.collection = collection;
    
    [self addSubview:label];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"label":label, @"col":collection};
    NSDictionary *metrics = @{@"colheight":@(colheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[label]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[label]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[col(colheight)]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)selectindex:(NSUInteger)index
{
    for(NSUInteger i = 0; i < starsnum; i++)
    {
        BOOL selected = i <= index;
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
        [[self.collection cellForItemAtIndexPath:indexpath] setSelected:selected];
    }
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat totalwidth = col.bounds.size.width;
    CGFloat remaining = totalwidth - cellshorizontal;
    CGFloat margin = remaining / 2.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return starsnum;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vcontactratecell *cell = [col dequeueReusableCellWithReuseIdentifier:ratecell forIndexPath:index];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    [self selectindex:index.item];
}

@end