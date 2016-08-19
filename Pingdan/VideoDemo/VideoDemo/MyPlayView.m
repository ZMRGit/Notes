//
//  MyPlayView.m
//  ejfgsdgjhfsgdgsfhdgdfx
//
//  Created by qianfeng on 13-11-19.
//  Copyright (c) 2013年 qianfeng. All rights reserved.
//

#import "MyPlayView.h"

@implementation MyPlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
+(Class)layerClass
{
    return [AVPlayerLayer class];
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
