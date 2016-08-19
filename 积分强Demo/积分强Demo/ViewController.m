//
//  ViewController.m
//  积分强Demo
//
//  Created by chenguangjiang on 14-7-16.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goDetail:(id)sender {
    ViewController1 * ctl = [[ViewController1 alloc]init];
    [self presentViewController:ctl animated:NO completion:nil];
    [ctl release];
    
}
@end
