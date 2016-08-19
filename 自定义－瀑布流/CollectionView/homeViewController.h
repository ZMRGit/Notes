//
//  homeViewController.h
//  CollectionView
//
//  Created by d2space on 14-2-12.
//  Copyright (c) 2014年 D2space. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WaterF.h"

@interface homeViewController : UIViewController

@property (nonatomic,strong) WaterF* waterfall;
@property (nonatomic,strong) NSMutableArray* images;
@property (nonatomic,strong) NSArray* texts;

@end
