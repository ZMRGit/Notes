//
//  CVViewController.h
//  CollnectView
//
//  Created by 赵 锋 on 13-12-16.
//  Copyright (c) 2013年 赵 锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CVViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *coll;
@end
