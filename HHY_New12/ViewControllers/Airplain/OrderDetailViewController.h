//
//  OrderDetailViewController.h
//  HHY
//
//  Created by jiangjun on 14-4-30.
//  Copyright (c) 2014年 yunluosoft. All rights reserved.
//

#import "RootViewController.h"
@class OrderDetailModel;

@interface OrderDetailViewController : RootViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}

@property(nonatomic,copy)NSString *orderNum;
@property(nonatomic,retain)OrderDetailModel *dataModel;
@property(nonatomic,copy)NSString *allCountPrice;
@property(nonatomic, retain)NSString *orderState;
@property(nonatomic,assign) BOOL isShenPi;
@property(nonatomic,copy)NSString *username;

@end
