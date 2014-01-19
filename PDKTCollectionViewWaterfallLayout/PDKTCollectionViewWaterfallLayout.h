//
//  PDKTCollectionViewWaterfallLayout.h
//
//  Created by Daniel García on 19/1/14.
//  Copyright (c) 2014 Produkt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PDKTCollectionViewWaterfallLayout;
@protocol PDKTCollectionViewWaterfallLayoutDelegate <UICollectionViewDelegate>
- (NSUInteger)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout numberOfColumnsInSection:(NSUInteger)section;
@optional
/// You MUST implement ONE of the two following methods
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout heightItemAtIndexPath:(NSIndexPath *)indexPath;
// Sometimes you would prefer your cells to mantain an specific aspect ratio. In these cases, you and implement the following method and
// leave PDKTCollectionViewWaterfallLayout do cells size calculations
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout aspectRatioForIndexPath:(NSIndexPath *)indexPath;



- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout itemSpacingInSection:(NSUInteger)section;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout sectionInsetForSection:(NSUInteger)section;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(PDKTCollectionViewWaterfallLayout *)collectionViewLayout sizeForSupplementaryViewInSection:(NSUInteger)section kind:(NSString *)kind;
@end

@interface PDKTCollectionViewWaterfallLayout : UICollectionViewLayout
@property (nonatomic, weak) id<PDKTCollectionViewWaterfallLayoutDelegate> delegate;

// If column count, item spacing and/or section insets are constans on all your sections, you can use the following setters and avoid implementing some delegate methods
@property (nonatomic, assign) NSUInteger columnCount;
@property (nonatomic, assign) CGFloat itemSpacing;
@property (nonatomic, assign) UIEdgeInsets sectionInset;
@end
