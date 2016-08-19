//
//  ViewController.m
//  加速计
//
//  Created by chenguangjiang on 14-12-2.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>
@interface ViewController ()<UIAccelerometerDelegate>
{
    CGPoint _ballVolecity;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ballVolecity = CGPointZero;
    
    UIAccelerometer *acce = [UIAccelerometer sharedAccelerometer];

    //设置更新时间
    [acce setUpdateInterval:1.0/30.0];
    acce.delegate = self;
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    //acceleration.x x方向最新的速度
    NSLog(@"%f",acceleration.x);
    _ballVolecity.x += acceleration.x;
    _ballVolecity.y -= acceleration.y;
    CGPoint center = _ball.center;
    [_ball setCenter:CGPointMake(center.x + _ballVolecity.x, center.y + _ballVolecity.y)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
