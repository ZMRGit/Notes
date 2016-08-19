//
//  MyLayout.m
//  ConllectionViewDemo
//
//  Created by chenguangjiang on 14-9-6.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "MyLayout.h"

@implementation MyLayout

-(CGSize)collectionViewContentSize
{
    return CGSizeMake(100, 100);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 5;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
@end
