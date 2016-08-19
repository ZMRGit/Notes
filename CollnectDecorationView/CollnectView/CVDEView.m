//
//  CVDEView.m
//  CollnectView
//
//  Created by 赵 锋 on 13-12-16.
//  Copyright (c) 2013年 赵 锋. All rights reserved.
//

#import "CVDEView.h"

@implementation CVDEView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:frame];
        imageView.image=[UIImage imageNamed:@"BookShelfCell.png"];
        
        [self addSubview:imageView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
