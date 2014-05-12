//
//  CollectionViewManager.m
//  PDKTStickySectionHeadersCollectionViewLayoutDemo
//
//  Created by Daniel García on 31/12/13.
//  Copyright (c) 2013 Produkt. All rights reserved.
//

#import "CollectionViewManager.h"
#import "CollectionViewCell.h"
#import "CollectionViewSectionHeader.h"
#import "CollectionViewSectionFooter.h"

static NSUInteger const kNumberOfColumns = 3;
static NSUInteger const kItemSpacing = 5.0;
static NSUInteger const kNumberOfSections = 5;
static NSUInteger const kNumberItemsPerSection = 10;
static NSUInteger const kDemoEmptySection = 2;
@interface CollectionViewManager()
@property (strong,nonatomic) UINib *cellNib;
@property (strong,nonatomic) UINib *sectionHeaderNib;
@property (strong,nonatomic) UINib *sectionFooterNib;
@end
@implementation CollectionViewManager

- (void)setCollectionView:(UICollectionView *)collectionView{
    _collectionView=collectionView;
    if (_collectionView) {
        [self initCollectionView:collectionView];
    }
}
- (void)initCollectionView:(UICollectionView *)collectionView{
    collectionView.dataSource=self;
    collectionView.delegate=self;
    [self registerCellsForCollectionView:collectionView];
    [self registerSectionHeaderForCollectionView:collectionView];
    [collectionView reloadData];
}
#pragma mark - Cells
- (UINib *)cellNib{
    if (!_cellNib) {
        _cellNib = [UINib nibWithNibName:@"CollectionViewCell" bundle:nil];;
    }
    return _cellNib;
}
- (UINib *)sectionHeaderNib{
    if (!_sectionHeaderNib) {
        _sectionHeaderNib = [UINib nibWithNibName:@"CollectionViewSectionHeader" bundle:nil];
    }
    return _sectionHeaderNib;
}
- (UINib *)sectionFooterNib{
    if (!_sectionFooterNib) {
        _sectionFooterNib = [UINib nibWithNibName:@"CollectionViewSectionFooter" bundle:nil];
    }
    return _sectionFooterNib;
}
- (void)registerCellsForCollectionView:(UICollectionView *)collectionView{
    [collectionView registerNib:self.cellNib forCellWithReuseIdentifier:@"CollectionViewCell"];
}
- (void)registerSectionHeaderForCollectionView:(UICollectionView *)collectionView{
    [collectionView registerNib:self.sectionHeaderNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionViewSectionHeader"];
    [collectionView registerNib:self.sectionFooterNib forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionViewSectionFooter"];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return kNumberOfSections;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return section == kDemoEmptySection ? 0 : kNumberItemsPerSection;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell;
    static NSString *cellIdentifier=@"CollectionViewCell";
    cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"Cell %d",indexPath.item];
    if (indexPath.item%2==0) {
        cell.backgroundColor=[UIColor redColor];
    }else{
        cell.backgroundColor=[UIColor blueColor];
    }
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *supplementaryView;
    if (kind==UICollectionElementKindSectionHeader) {
        supplementaryView=[self sectionHeaderInCollectionView:collectionView atIndexPath:indexPath];
    }else if (kind==UICollectionElementKindSectionFooter){
        supplementaryView=[self sectionFooterInCollectionView:collectionView atIndexPath:indexPath];
    }
    return supplementaryView;
}
- (CollectionViewSectionHeader *)sectionHeaderInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath{
    CollectionViewSectionHeader *sectionHeaderView;
    static NSString *viewIdentifier=@"CollectionViewSectionHeader";
    sectionHeaderView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:viewIdentifier forIndexPath:indexPath];
    NSString *sectionHeaderTitle=[NSString stringWithFormat:@"Section Header %d",indexPath.section];
    sectionHeaderView.titleLabel.text=sectionHeaderTitle;
    sectionHeaderView.titleLabel.textColor=[UIColor whiteColor];
    sectionHeaderView.backgroundColor=[UIColor blackColor];
    return sectionHeaderView;
}
- (CollectionViewSectionFooter *)sectionFooterInCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath{
    CollectionViewSectionFooter *sectionFooterView;
    static NSString *viewIdentifier=@"CollectionViewSectionFooter";
    sectionFooterView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:viewIdentifier forIndexPath:indexPath];
    NSString *sectionFooterTitle=[NSString stringWithFormat:@"Section Footer %d",indexPath.section];
    sectionFooterView.titleLabel.text=sectionFooterTitle;
    sectionFooterView.titleLabel.textColor=[UIColor whiteColor];
    sectionFooterView.backgroundColor=[UIColor grayColor];
    return sectionFooterView;
}

#pragma mark - UICollectionViewDelegate


#pragma mark - PDKTCollectionViewWaterfallLayoutDelegate
- (NSUInteger)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout numberOfColumnsInSection:(NSUInteger)section{
    NSUInteger numberOfColumns=kNumberOfColumns;
    if(section%2!=0){
        numberOfColumns--;
    }
    return numberOfColumns;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout heightItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat itemHeight=0.0;
    if (indexPath.item%3==0) {
        itemHeight=200.0;
    }else if(indexPath.item%2==0){
        itemHeight=300.0;
    }else{
        itemHeight=150.0;
    }
    return itemHeight;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout itemSpacingInSection:(NSUInteger)section{
    return kItemSpacing;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout sectionInsetForSection:(NSUInteger)section{
    if (section==kDemoEmptySection) {
        return UIEdgeInsetsZero;
    }
    return UIEdgeInsetsMake(2, 2, 2, 2);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout sizeForSupplementaryViewInSection:(NSUInteger)section kind:(NSString *)kind{
    return CGSizeMake(self.collectionView.bounds.size.width, 60);
}
- (BOOL)shouldStickHeaderToTopInSection:(NSUInteger)section{
    return YES;
}
@end
