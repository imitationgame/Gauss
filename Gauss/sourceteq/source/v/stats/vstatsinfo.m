#import "vstatsinfo.h"

static NSString* const infocell = @"cellid";
static NSUInteger const itemseparation = 2;
static NSUInteger const cellwidth = 30;
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
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setItemSize:CGSizeMake(cellwidth, colheight)];
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
    
    UILabel *labelempty = [[UILabel alloc] init];
    [labelempty setBackgroundColor:[UIColor clearColor]];
    [labelempty setUserInteractionEnabled:NO];
    [labelempty setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labelempty setTextAlignment:NSTextAlignmentCenter];
    [labelempty setFont:[UIFont fontWithName:fontregularname size:18]];
    [labelempty setTextColor:colorthird];
    [labelempty setNumberOfLines:0];
    [labelempty setText:NSLocalizedString(@"stats_empty", nil)];
    [labelempty setHidden:YES];
    self.labelempty = labelempty;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setFont:[UIFont fontWithName:fontregularname size:18]];
    [labeltitle setTextColor:colorthird];
    [labeltitle setNumberOfLines:0];
    [labeltitle setText:NSLocalizedString(@"stats_title", nil)];
    [labeltitle setHidden:YES];
    self.labeltitle = labeltitle;
    
    UIView *border = [[UIView alloc] init];
    [border setBackgroundColor:colorsecond];
    [border setTranslatesAutoresizingMaskIntoConstraints:NO];
    [border setClipsToBounds:YES];
    [border setUserInteractionEnabled:NO];
    
    [self addSubview:collection];
    [self addSubview:labelempty];
    [self addSubview:labeltitle];
    [self addSubview:border];
    
    NSDictionary *views = @{@"col":collection, @"labelempty":labelempty, @"border":border, @"labeltitle":labeltitle};
    NSDictionary *metrics = @{@"colheight":@(colheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col(colheight)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labelempty]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[labelempty]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[labeltitle]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[labeltitle]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[border]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[border(1)]-0-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedcoursesloaded:) name:notcoursesloaded object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedstatsready:) name:notstatsready object:nil];
    [self.model refresh];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedcoursesloaded:(NSNotification*)notification
{
    [self.model refresh];
}

-(void)notifiedstatsready:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       if(self.model.items.count)
                       {
                           [self.labeltitle setHidden:NO];
                           [self.labelempty setHidden:YES];
                       }
                       else
                       {
                           [self.labeltitle setHidden:YES];
                           [self.labelempty setHidden:NO];
                       }
                       
                       [self.collection reloadData];
                   });
}

#pragma mark -
#pragma mark col del

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