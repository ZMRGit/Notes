//
//  ViewController.m
//  LoopScrollDemo
//
//  Created by chenguangjiang on 15/11/10.
//  Copyright © 2015年 Dengchenglin. All rights reserved.
//

#import "ViewController.h"
#import "LoopScrollView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *dataSoures = @[@{@"image":@"http://image.geihui.com/uploadfiles/artimgs/201511/564059f0b1423_640_360.jpg"},
                            @{@"image":@"http://image.geihui.com/uploadfiles/artimgs/201510/56299597a1176_640_360.jpg"},
                            @{@"image":@"http://image.geihui.com/uploadfiles/artimgs/201511/5641553bedc06_640_360.jpg"},
                            @{@"image":@"http://image.geihui.com/uploadfiles/artimgs/201511/56400d32ca4e0_640_360.jpg"},
                        ];
    LoopScrollView *view = [[LoopScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    view.backgroundColor = [UIColor yellowColor];
    view.models = [LoopScrollModel modelsWithDataSoures:dataSoures];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
