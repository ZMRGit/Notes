//
//  BaseNavitionViewController.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-5.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "BaseNavitionViewController.h"

@interface BaseNavitionViewController ()

@end

@implementation BaseNavitionViewController

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
	self.navigationBarHidden = YES;
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
