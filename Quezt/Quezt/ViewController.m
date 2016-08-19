//
//  ViewController.m
//  Quezt
//
//  Created by chenguangjiang on 14-7-3.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "MyViewController.h"
#import "MyWebView.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController
{
    MyWebView *webView;
    CALayer *layer;
    CALayer *layer2;
    UIView *_demoView;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _demoView = [[UIView alloc]initWithFrame:CGRectMake(100, 220, 100, 100)];
    _demoView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_demoView];
    [_demoView release];
    
    [self method2];
}

//隐式动画
-(void)method1
{
    layer = [CALayer layer];
    [layer setPosition:CGPointMake(100, 100)]; //设置中心点
    [layer setBounds:CGRectMake(0, 0, 200, 200)];
    [layer setBackgroundColor:[UIColor redColor].CGColor];
 
    UIImage *image = [UIImage imageNamed:@"shop_fl_icon_co.png"];
    [layer setContents:(id)[image CGImage]];
    [self.view.layer addSublayer:layer];
    
    
}

-(void)method2
{
    layer2 = [CALayer layer];
    [layer2 setPosition:CGPointMake(100, 100)]; //设置中心点
    [layer2 setBounds:CGRectMake(0, 0, 200, 200)];
    [layer2 setBackgroundColor:[UIColor redColor].CGColor];
    layer2.delegate = self;
    [layer2 setNeedsDisplay];
    [self.view.layer addSublayer:layer2];
}
-(void)method3
{
    CADisplayLink *timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(step:)];
    [timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

//每秒调用60次
-(void)step:(CADisplayLink *)sender
{
    NSLog(@"%f",sender.timestamp);
}

//CABasicAnimation基本平移动画方法
-(void)method4:(CGPoint)location
{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position"];//设置动画属性 平移
    [anim setToValue:[NSValue valueWithCGPoint:location]];//动画移动的位置   仅仅是view的layer层移动  但是view的frame仍不变
    [anim setDuration:1.0];//动画时长
    anim.delegate = self;
    //让动画结束后视图停留在最后的位置  YES则会回到原位置  因为这只是view的layer在平移
    [anim setRemovedOnCompletion:NO];
    [anim setFillMode:kCAFillModeForwards];
    
    
    //设置速度控制 加速 减速等
    [anim setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    
    [_demoView.layer addAnimation:anim forKey:nil];
    
  
}
//anim的代理方法
-(void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"动画开始");
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"动画结束");
}
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
    CGContextFillEllipseInRect(ctx, CGRectMake(0, 0, 200, 200));
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    //开始事物
//    [CATransaction begin];
//    //禁用操作
//    [CATransaction setDisableActions:YES];
//    //提交事物
//    [CATransaction commit];
    
    
    //layer默认会产生动画效果
    [layer setOpacity:0.5f];//设置透明度
    [layer setBounds:CGRectMake(0, 0, 300, 300)];
    [layer setPosition:CGPointMake(150, 200)];
    
    
  //method4
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    [self method4:location];
    
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
-(void)Act
{
    MyViewController *view = [[MyViewController alloc]init];
    [self presentViewController:view animated:YES completion:nil];
    
    [view release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
