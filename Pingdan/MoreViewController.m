//
//  MoreViewController.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-5.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "MoreViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface MoreViewController ()

@end

@implementation MoreViewController

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
	UIView *v = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 60, 60)];
    v.backgroundColor = [UIColor blackColor];
    [[v layer] setCornerRadius:5];
    UIActivityIndicatorView *act = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(15, 15, 30, 30)];
    act.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
    act.hidesWhenStopped = YES;
    [v addSubview:act];
    [act startAnimating];
    
    [self.view addSubview:v];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
