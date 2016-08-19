//
//  ViewController.m
//  精准定时器
//
//  Created by chenguangjiang on 14-10-10.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
static long steps;
@interface ViewController ()
{
    CADisplayLink *_gameTimer;
    CFTimeInterval _startTime;//时钟触发的初时时间
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //促使话游戏时钟
	_gameTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(step)];
    //初始化时钟之后，需要把它添加到主运行循环中;
    [_gameTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}
//方法一
-(void)updateTimer:(CADisplayLink *)sender
{
    NSLog(@"%f",sender.timestamp);
    if(_startTime == 0)
    {
        _startTime = sender.timestamp;
    }
    
    CFTimeInterval deltaTime = sender.timestamp - _startTime;
    if(deltaTime > 1.0)
    {
        _startTime = sender.timestamp;
        NSLog(@"一秒了 该做某事了1");
        
    }
}
//方法2
-(void)step
{
    if(steps % 60 == 1)
    {
        NSLog(@"一秒到了 该做某事了2");
    }
    steps++;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
