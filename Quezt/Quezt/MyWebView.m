//
//  MyWebView.m
//  Quezt
//
//  Created by chenguangjiang on 14-7-4.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "MyWebView.h"
#import "MyScrollView.h"
@implementation MyWebView
{
    MyScrollView *myScorellView;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        myScorellView = [[MyScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 540)];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(void)layoutSubviews
{
    [self.layer setTransform:CATransform3DMakeRotation(M_PI, 0, 1, 0)];
    
}
- (void)drawRect:(CGRect)rect
{
    
    //获取一个与试图相关联的上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.1创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    //2.2设置路径起点
    CGPathMoveToPoint(path, NULL, 50, 50);
    //2.3增加路径内容
    CGPathAddLineToPoint(path, NULL, 150, 150);
    CGPathAddLineToPoint(path, NULL, 50, 150);
    // CGPathAddLineToPoint(path, NULL, 50, 50);
    //闭合路径
    CGPathCloseSubpath(path);
    
    //3 将路径添加到上下文
    CGContextAddPath(context, path);
    //4 设置上下文状态
    //4.1设置填充颜色
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1);
    //4.2设置边框颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1);
    //设置线宽
    CGContextSetLineWidth(context, 10);
    
    //设置连接点样式
    //圆角
    CGContextSetLineJoin(context,  kCGLineJoinRound);
    //平角kCGLineJoinBevel
    //设置连接首位样式
    //CGContextSetLineCap(context, kCGLineCapSquare);
    //设置虚线样式
    //第一个参数表示从哪里开始画虚线
    //第三个参数表示共有几条虚线 每条虚线的长度
    //第四个参数表示 第二个参数数组的长度
    CGFloat lengthes[2] = {10.0,10.0};
    CGContextSetLineDash(context, 0, lengthes, 2);
    
    //既填充又有边线
    CGContextDrawPath(context, kCGPathFillStroke);
    //释放
    CGPathRelease(path);

}

@end
