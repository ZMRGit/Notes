//
//  Demo.m
//  BlockARCDemo
//
//  Created by chenguangjiang on 15-1-17.
//  Copyright (c) 2015年 chenguangjiang. All rights reserved.
//

#import "Demo.h"
#import <objc/runtime.h>
@implementation Demo

-(instancetype)init
{
    if(self = [super init])
    {
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(putAct) userInfo:nil repeats:NO];
    }
    return self;
}
-(void)putAct
{
    _blk();
}

- (void)dealloc
{
    NSLog(@"Demo dealloc");
}

@end
