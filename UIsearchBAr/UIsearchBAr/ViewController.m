//
//  ViewController.m
//  UIsearchBAr
//
//  Created by chenguangjiang on 14-8-25.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "GHSearchTaBaoGoodsViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    [but setFrame:CGRectMake(50, 100, 100, 30)];
    but.backgroundColor = [UIColor brownColor];
    [but setTitle:@"PUSH" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
}
-(void)push
{
    GHSearchTaBaoGoodsViewController *ctl = [[GHSearchTaBaoGoodsViewController alloc]init];
    [self.navigationController pushViewController:ctl animated:YES];
    [ctl release];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
