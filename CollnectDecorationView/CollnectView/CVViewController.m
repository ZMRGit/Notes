//
//  CVViewController.m
//  CollnectView
//
//  Created by 赵 锋 on 13-12-16.
//  Copyright (c) 2013年 赵 锋. All rights reserved.
//

#import "CVViewController.h"
#import "CVCell.h"
#import "CVLayout.h"
@interface CVViewController ()

@end

@implementation CVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self.coll registerClass:[CVCell class] forCellWithReuseIdentifier:@"cell"];
    CVLayout *layout=[[CVLayout alloc] init];
    [self.coll setCollectionViewLayout:layout];
    
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 3;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
   
    
    return cell;
    
}
-(void)dealloc{
    
}

@end
