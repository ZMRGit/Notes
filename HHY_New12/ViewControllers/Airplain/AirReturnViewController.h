//
//  AirReturnViewController.h
//  HHY
//
//  Created by jiangjun on 14-6-4.
//  Copyright (c) 2014年 yunluosoft. All rights reserved.
//

#import "RootViewController.h"//退票界面
@class AirOrderModel;

@interface AirReturnViewController : RootViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@property(nonatomic,retain)UITextView *textView;
@property(nonatomic,retain)AirOrderModel *airModel;


@end
