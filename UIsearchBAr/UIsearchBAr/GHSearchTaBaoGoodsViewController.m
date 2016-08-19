//
//  GHSearchTaBaoGoodsViewController.m
//  GeiHui
//
//  Created by chenguangjiang on 14-8-23.
//  Copyright (c) 2014年 adways. All rights reserved.
//

#import "GHSearchTaBaoGoodsViewController.h"
@interface GHSearchTaBaoGoodsViewController ()<UITextFieldDelegate,UIAlertViewDelegate>
{
    UITableView *_tableView;
    UITableView *_searchTableView;
}
@end

@implementation GHSearchTaBaoGoodsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
 
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.navigationController.navigationBarHidden = YES;
    [self.searchDisplayController setActive:YES];
    __searchB.text = @" ";
//    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
//    _searchBar.delegate = self;
//    _searchCtl = [[UISearchDisplayController alloc]initWithSearchBar:_searchBar contentsController:self];
//    [_searchBar release];
//    _searchCtl.delegate = self;
//    _searchCtl.searchResultsDataSource = self;
//    _searchCtl.searchResultsDelegate = self;
//
//    [self.view addSubview:_searchBar];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        static NSString *celled = @"searchTableViewCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celled];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:celled];
        }
        cell.textLabel.text = @"hehe";
        return cell;
 
    

}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    [_searchTableView reloadData];
    return YES;
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [_searchTableView reloadData];
    return YES;
}


- (void)dealloc
{
    [__searchB release];
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
