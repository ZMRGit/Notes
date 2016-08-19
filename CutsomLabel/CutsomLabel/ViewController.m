//
//  ViewController.m
//  CutsomLabel
//
//  Created by chenguangjiang on 14-9-25.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "attributedLabel.h"
#import <CoreText/CoreText.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    attributedLabel *label = [[attributedLabel alloc]initWithFrame:CGRectMake(50, 50, 200, 500)];
    label.numberOfLines = 0;
    [label setText:@"sdfskvazbd,vshbdjsvcnvzccgadvjhsBVz,vj"];
    [label setLineGap:50];

    
    [label setTextColor:[UIColor redColor]];
    
  
    [self.view addSubview:label];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
