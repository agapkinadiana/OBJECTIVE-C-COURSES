//
//  ViewController.m
//  UICollectionViewFlowLayoutDemo
//
//  Created by Alexander Porshnev on 5/2/20.
//  Copyright © 2020 Alexander Porshnev. All rights reserved.
//

#import "ViewController.h"
#import "ImageCollectionViewCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray<NSArray *> *imageNames;
@property (nonatomic, assign) int numberOfColumns;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *imageNamesSect1 = [NSMutableArray new];
    NSMutableArray *imageNamesSect2 = [NSMutableArray new];
    
    for (int i = 1; i < 4; i++) {
        [imageNamesSect1 addObject:[[NSString alloc] initWithFormat:@"Image%d", i]];
    }
    for (int i = 4; i <= 10; i++) {
        [imageNamesSect2 addObject:[[NSString alloc] initWithFormat:@"Image%d", i]];
    }
    
    self.imageNames = [NSArray arrayWithObjects:imageNamesSect1, imageNamesSect2, nil];
    self.numberOfColumns = 3;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Change" style:UIBarButtonItemStyleDone target:self action:@selector(listButtonTaped:)];
}
// называем количество секций
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.imageNames.count;
}
// называем количество ячеек
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageNames[section].count;
}
// берем ячейки
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCellIdentifier" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:self.imageNames[indexPath.section][indexPath.row]];
    return cell;
}
// чтобы картинки отображались в изначальном размере
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *imageName = self.imageNames[indexPath.section][indexPath.row];
    UIImage *image = [UIImage imageNamed:imageName];
    
    CGFloat width = (self.view.bounds.size.width - (self.numberOfColumns * 10)) / self.numberOfColumns;
    CGFloat height = image.size.height * width / image.size.width;
    
    return CGSizeMake(width, height);
}
// минимальное расстояние между линиями секций
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (IBAction)listButtonTaped:(UIButton *)sender {
    if (self.numberOfColumns == 1) {
        self.numberOfColumns = 3;
    } else {
        self.numberOfColumns = 1;
    }
    [self.collectionView.collectionViewLayout invalidateLayout];
}

@end
