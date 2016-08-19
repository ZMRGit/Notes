//
//  ViewController.m
//  BlockPushDemo
//
//  Created by 方廷超 on 14/12/11.
//  Copyright (c) 2014年 方廷超. All rights reserved.
//

#import "ViewController.h"
#import "DetailController.h"
#import "CONST.h"
#import "BaseNavigationView.h"
@interface ViewController ()
{
    BaseNavigationView *baseNavigationBar;
}
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
     baseNavigationBar = [[BaseNavigationView alloc] initWithFrame:CGRectMake(0, 0, size.width, 64)];
    [self.view addSubview:baseNavigationBar];
    
    [baseNavigationBar setRightNomalImage:@"back.png"];
    


    [baseNavigationBar setRightNavigationClickCallBack:^(BaseNavigationView *navibaseView) {
        
    }];
    

  // Do any additional setup after loading the view, typically from a nib.
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
