//
//  ViewController1.m
//  ConllectionViewDemo
//
//  Created by chenguangjiang on 14-9-5.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController1.h"
#import "ConllectionCell.h"
#import "MyLayout.h"
#import "LineLayout.h"
#import "SuplleView.h"
#import "MJRefresh.h"
@interface ViewController1 ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,MJRefreshBaseViewDelegate>
{
    MJRefreshHeaderView *_header;
}
@end

@implementation ViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _myConllectionView.backgroundColor = [UIColor whiteColor];
    
    [_myConllectionView setCollectionViewLayout:[[LineLayout alloc]init]];
    //注册cell
    [_myConllectionView registerNib:[UINib nibWithNibName:@"ConllectionCell" bundle:nil] forCellWithReuseIdentifier:@"ConllectionCell"];
    //注册页眉页脚
         [_myConllectionView registerNib:[UINib nibWithNibName:@"SuplleView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SuplleView"];
  [_myConllectionView registerNib:[UINib nibWithNibName:@"SuplleView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SuplleView"];
    _header = [[MJRefreshHeaderView alloc]init];
    _header.delegate = self;
    _header.scrollView = _myConllectionView;
}

//加载页眉与页脚

//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    
//
//    NSLog(@"%@",kind);
//
//    if([kind isEqualToString:UICollectionElementKindSectionFooter])
//    {
//        UICollectionReusableView *v = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SuplleView" forIndexPath:indexPath];
//        NSLog(@"%@",v);
//         return v;
//    }
//
//
//      UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"SuplleView" forIndexPath:indexPath];
//    NSLog(@"%@",view);
//    return view;
//}
//页脚size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    
    return CGSizeMake(100, 50);
}
//页眉size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(100, 100);
}
//cell的size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);

}


//横间隙(可局部设置)
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//竖间隙(可局部设置)
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    [_header endRefreshing];
    return 2;
}
//每section总共有多少个？
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ConllectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ConllectionCell" forIndexPath:indexPath];
    // cell的高亮状态  cell.highlighted;有方法监听 可通过更改cell.backgrondView来区分
    //cell 的选中状态 cell.selected;有方法监听 可通过更改cell.selectBackgrondView来区分
  

    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%d",indexPath.row);
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


//是否显示菜单
-(BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{

    return YES;
}

//是否取消选中
-(BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}


-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    if(refreshView == _header)
    {
        [_myConllectionView reloadData];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
