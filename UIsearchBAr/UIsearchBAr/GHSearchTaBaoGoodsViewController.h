//
//  GHSearchTaBaoGoodsViewController.h
//  GeiHui
//
//  Created by chenguangjiang on 14-8-23.
//  Copyright (c) 2014年 adways. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHSearchTaBaoGoodsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchDisplayDelegate,UISearchBarDelegate>
{
    UISearchBar *_searchBar;
    UISearchDisplayController *_searchCtl;
}

@property (assign, nonatomic) IBOutlet UISearchBar *_searchB;

-(void)didloadUrl:(NSString *)str;
@end
