//
//  ViewController.m
//  XmppDemo
//
//  Created by chenguangjiang on 14-7-15.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController1ViewController.h"
#import "VCDelegate.h"
@interface ViewController ()<UIAlertViewDelegate>
{
    NSFetchedResultsController *_fetchedResultsController;
    id <VCDelegate>delegate;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
  
 
    
    self.title = @"TestDemo";
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    NSURL *url= [NSURL URLWithString:@"http://code4app.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    
    
    
  //  NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys:@"",@"heh",@"2",@"haha", nil];
    
  
    
    UIBarButtonItem *but = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
 
    self.navigationItem.rightBarButtonItem = but;
}

-(void)back
{
    UIViewController1ViewController *ctl = [[UIViewController1ViewController alloc]init];
 
    [self.navigationController pushViewController:ctl animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
