//
//  CoreView.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-13.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "CoreView.h"

@implementation CoreView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //设置画线颜色
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    //设置填充的颜色
   // CGContextSetFillColorWithColor(ctx, [UIColor greenColor].CGColor);
    
    
    //设置绘制线的宽度
    CGContextSetLineWidth(ctx, 2);
    //让画笔移动到某一点
    CGContextMoveToPoint(ctx, 10, 20);
    //添加一条线  从10,20画到200,20
    CGContextAddLineToPoint(ctx, 200, 20);
    //添加多个点组成多个线
   // CGContextAddLines(<#CGContextRef c#>, <#const CGPoint *points#>, <#size_t count#>)
    
    //添加一个矩形
    CGContextAddRect(ctx, CGRectMake(10, 40, 100, 100));
   
    
    
    //绘画
    CGContextDrawPath(ctx, kCGPathStroke);
    
    //填充颜色绘画
    //CGContextDrawPath(ctx, kCGPathFillStroke);
}

@end
