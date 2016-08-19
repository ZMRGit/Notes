//
//  Demo.m
//  BlockDemo
//
//  Created by chenguangjiang on 14-10-11.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "Demo.h"

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
-(void)printf
{
    NSLog(@"printf");
}
- (void)dealloc
{
    [super dealloc];
}
@end
