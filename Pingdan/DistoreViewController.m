//
//  DistoreViewController.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-5.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "DistoreViewController.h"
#import "CoreView.h"
@interface DistoreViewController ()

@end

@implementation DistoreViewController

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
   CoreView *view = [[CoreView alloc]initWithFrame:CGRectMake(0, 20, 320, 200)];
    view.backgroundColor =[ UIColor blackColor];
    [self.view addSubview:view];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
