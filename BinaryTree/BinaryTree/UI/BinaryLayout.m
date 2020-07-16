#import "BinaryLayout.h"

@interface BinaryLayout ()
@property (nonatomic, retain) NSMutableArray<UICollectionViewLayoutAttributes *> *cache;
@property (nonatomic, assign) CGSize contentSize;
@end

@implementation BinaryLayout

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        [self commonInit];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        [self commonInit];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s %@", __PRETTY_FUNCTION__, self);
    
    [_cache release];
    [super dealloc];
}

- (void)commonInit {
    _cache = [[NSMutableArray alloc] initWithCapacity:16];

    _treeHeight = 0;

    _cellWidth = 50;
    _cellHeight = 50;

    _verticalSpacing = 10;
    _horizontalSpacing = 10;
}

- (void)setTreeHeight:(NSUInteger)treeHeight {
    _treeHeight = treeHeight;

    [self updateContentSize];
}

- (void)setCellWidth:(CGFloat)cellWidth {
    _cellWidth = MAX(0, cellWidth);

    [self updateContentSize];
}

- (void)setCellHeight:(CGFloat)cellHeight {
    _cellHeight = MAX(0, cellHeight);

    [self updateContentSize];
}

#pragma mark - UICollectionViewLayout

- (CGSize)collectionViewContentSize {
    return self.contentSize;
}

- (void)invalidateLayout {
    [super invalidateLayout];
    [self.cache removeAllObjects];
}

- (void)prepareLayout {
    if (self.cache.count > 0 || self.collectionView == nil) {
        return;
    }

    for (NSUInteger i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        [self.cache addObject:attributes];

        NSUInteger row = [self rowForIndex:i];
        CGFloat y = row * (self.cellHeight + self.verticalSpacing);
        NSUInteger maxNodesInRow = pow(2, row);
        NSUInteger column = [self columnForIndex:i];
        CGFloat spaceForCell = self.contentSize.width / maxNodesInRow;
        CGFloat x = spaceForCell * (column + 0.5);

        attributes.frame = CGRectMake(x, y, 100, 100);
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray<UICollectionViewLayoutAttributes *> *visibleLayoutAttributes = [NSMutableArray arrayWithCapacity:self.cache.count];

    for (UICollectionViewLayoutAttributes *attributes in self.cache) {
      if (CGRectIntersectsRect(attributes.frame, rect)) {
          [visibleLayoutAttributes addObject:attributes];
      }
    }

    return [[visibleLayoutAttributes copy] autorelease];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.cache.count) {
        return self.cache[indexPath.row];
    } else {
        return [[UICollectionViewLayoutAttributes new] autorelease];
    }
}

- (void)updateContentSize {
    NSUInteger maxNodesInRow = pow(2, self.treeHeight);
    CGFloat extraHorizontalSpace = maxNodesInRow == 1 ? 0 : self.treeHeight * self.horizontalSpacing;
    CGFloat extraVerticalSpace = self.treeHeight == 0 ? 0 : self.treeHeight * self.verticalSpacing;

    CGFloat width = maxNodesInRow * self.cellWidth + extraHorizontalSpace;
    CGFloat height = (self.treeHeight + 1) * self.cellHeight + extraVerticalSpace;

    self.contentSize =  CGSizeMake(width, height);
    [self invalidateLayout];
}

#pragma mark - Helpers

//0 - 0
//1 - 1 2
//2 - 3 4 5 6
//3 - 7 8 9 10 11 12 13 14
- (NSInteger)rowForIndex:(NSUInteger)index {
    NSUInteger dividend = index + 1;
    NSUInteger result = 0;
    while (dividend > 1) {
        result += 1;
        dividend /= 2;
    }
    return result;
}

- (NSUInteger)columnForIndex:(NSUInteger)index {
    NSUInteger row = [self rowForIndex:index];
    if (row == 0) {
        return 0;
    } else {
        NSUInteger firstIndexInRow = 1;
        for (NSUInteger i = 1; i < row; i++) {
            firstIndexInRow += pow(2, i);
        }
        NSUInteger result = index - firstIndexInRow;
        return result;
    }
}

@end
