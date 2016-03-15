#import "vstatsinfo.h"

static NSString* const infocell = @"cellid";
static NSUInteger const itemseparation = 10;
static NSUInteger const colheight = 300;

@implementation vstatsinfo

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    self.collectionheight = colheight;
    self.model = [[mstatsm alloc] init];
    self.cellwidth = 0;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:itemseparation];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flow setSectionInset:UIEdgeInsetsMake(0, itemseparation, 0, itemseparation)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setUserInteractionEnabled:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vstatsinfocell class] forCellWithReuseIdentifier:infocell];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{@"colheight":@(colheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col(colheight)]" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedstatsready:) name:notstatsready object:nil];
    [self.model refresh];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedstatsready:(NSNotification*)notification
{
    CGFloat maxwidth = self.collection.bounds.size.width;
    CGFloat width_left = maxwidth - itemseparation;
    NSUInteger totalitems = self.model.items.count;
    
    if(totalitems)
    {
        CGFloat cellrawwidth = floorf(width_left / totalitems);
        self.cellwidth = cellrawwidth - itemseparation;
    }
    else
    {
        self.cellwidth = 0;
    }
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.collection reloadData];
                   });
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(self.cellwidth, colheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mstatsitem *model = self.model.items[index.item];
    
    vstatsinfocell *cell = [col dequeueReusableCellWithReuseIdentifier:infocell forIndexPath:index];
    [cell config:model];
    
    return cell;
}

@end