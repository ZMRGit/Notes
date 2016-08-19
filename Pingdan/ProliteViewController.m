//
//  ProliteViewController.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-5.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ProliteViewController.h"
#import "Switch3DTransition.h"
#import "HMGLTransitionManager.h"
#import "CoreView.h"
@interface ProliteViewController ()

@end

@implementation ProliteViewController
{
    UIView *myView;
    UIView *myView1;
    UIView *myView2;
}
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
	self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, 10, 100, 30);
    [but setTitle:@"切换视图" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(exchange) forControlEvents:UIControlEventTouchUpInside];
    but.backgroundColor = [UIColor brownColor];
    [self.view addSubview:but];
    
    
    myView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    myView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myView];
    
    
    myView1 =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    myView1.backgroundColor = [UIColor blueColor];
    [myView addSubview:myView1];
    
    
    
    myView2 =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    myView2.backgroundColor = [UIColor redColor];
    [myView addSubview:myView2];
    
    
    
 
    
    
}
-(void)exchange
{
    Switch3DTransition *swtichTr = [[Switch3DTransition alloc]init];
    
    //设置动画类型对象
        [[HMGLTransitionManager sharedTransitionManager] setTransition:swtichTr];
    [[HMGLTransitionManager sharedTransitionManager] beginTransition:myView];
    [myView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    
    [[HMGLTransitionManager sharedTransitionManager]commitTransition];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
