//
//  CVCell.m
//  CollnectView
//
//  Created by 赵 锋 on 13-12-16.
//  Copyright (c) 2013年 赵 锋. All rights reserved.
//

#import "CVCell.h"

@implementation CVCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *iv=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 215/3.0, 303/3.0)];
        iv.image=[UIImage imageNamed:@"book1.jpeg"];
        
        [self.contentView addSubview:iv];
        
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
