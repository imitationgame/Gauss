#import "vstats.h"

static NSString* const coursehaderid = @"course";
static NSString* const chaptercellid = @"chapter";
static NSUInteger const barmaxheight = 65;
static NSUInteger const barminheight = 20;
static NSUInteger const infominheight = 100;
static NSUInteger const headerheight = 80;
static NSUInteger const cellheight = 100;
static NSUInteger const linespacing = 2;
static NSUInteger const footerspacing = 50;

@interface vstats ()

@property(weak, nonatomic)cstats *controller;

@end

@implementation vstats

@dynamic controller;

-(instancetype)init:(cstats*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];

    vstatsbar *bar = [[vstatsbar alloc] init:controller];
    self.bar = bar;
    
    vstatsinfo *info = [[vstatsinfo alloc] init];
    self.info = info;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:linespacing];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    
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
    
    NSDictionary *views = @{@"bar":bar, @"info":info, @"col":collection};
    NSDictionary *metrics = @{};
    
    self.layoutbarheight = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:barmaxheight];
    self.layoutinfoheight = [NSLayoutConstraint constraintWithItem:info attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:info.collectionheight];
    self.layoutinfotop = [NSLayoutConstraint constraintWithItem:info attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:barmaxheight];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[info]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.layoutbarheight];
    [self addConstraint:self.layoutinfoheight];
    [self addConstraint:self.layoutinfotop];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedcoursesloaded:) name:notcoursesloaded object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedcoursesloaded:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self refresh];
                   });
}

#pragma mark functionality

-(void)refresh
{
    [self.collection reloadData];
}

-(mcourseitemchapter*)chapterfor:(NSIndexPath*)index
{
    NSUInteger course = index.section - 1;
    NSUInteger item = index.item;
    mcourseitemchapter *chapter = [mcourse singleton].courses[course].chapters[item];
    
    return chapter;
}

#pragma mark -
#pragma mark col del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offsety = scroll.contentOffset.y;
    CGFloat newbarheight = barmaxheight - offsety;
    CGFloat newinfoheight = self.info.collectionheight - offsety;
    CGFloat newinfotop;
    
    if(newbarheight > barmaxheight)
    {
        newbarheight = barmaxheight;
    }
    else if(newbarheight < barminheight)
    {
        newbarheight = barminheight;
    }
    
    if(newinfoheight < infominheight)
    {
        CGFloat delta = infominheight - newinfoheight;
        newinfoheight = infominheight;
        newinfotop = newbarheight - delta;
    }
    else
    {
        newinfotop = newbarheight;
    }
    
    self.layoutbarheight.constant = newbarheight;
    self.layoutinfoheight.constant = newinfoheight;
    self.layoutinfotop.constant = newinfotop;
}

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets;
    
    if(section)
    {
        insets = UIEdgeInsetsMake(0, 0, footerspacing, 0);
    }
    else
    {
        insets = UIEdgeInsetsMake(self.info.collectionheight, 0, 0, 0);
    }
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size;
    
    if(section)
    {
        size = CGSizeMake(col.bounds.size.width, headerheight);
    }
    else
    {
        size = CGSizeZero;
    }
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width, cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    NSUInteger sections = [mcourse singleton].courses.count + 1;
    
    return sections;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger items = 0;
    
    if(section)
    {
        NSUInteger course = section - 1;
        items = [mcourse singleton].courses[course].chapters.count;
    }
    
    return items;
}

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    NSUInteger course = index.section - 1;
    
    vstatsheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:coursehaderid forIndexPath:index];
    [header config:[mcourse singleton].courses[course]];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mcourseitemchapter *chapter = [self chapterfor:index];
    vstatscell *cell = [col dequeueReusableCellWithReuseIdentifier:chaptercellid forIndexPath:index];
    [cell config:chapter];
    
    return cell;
}

-(BOOL)collectionView:(UICollectionView*)col shouldHighlightItemAtIndexPath:(NSIndexPath*)index
{
    mcourseitemchapter *chapter = [self chapterfor:index];
    BOOL highlight = chapter.available;
    
    return highlight;
}

-(BOOL)collectionView:(UICollectionView*)col shouldSelectItemAtIndexPath:(NSIndexPath*)index
{
    mcourseitemchapter *chapter = [self chapterfor:index];
    BOOL selectable = chapter.available;
    
    return selectable;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mcourseitemchapter *chapter = [self chapterfor:index];
    [chapter startplaying];
    [self.controller play:chapter];
}

@end