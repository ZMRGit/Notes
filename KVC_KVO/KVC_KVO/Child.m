//
//  Child.m
//  KVC_KVO
//
//  Created by chenguangjiang on 14-9-24.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "Child.h"
@interface Child()

@property (nonatomic,assign)NSInteger age;
@end

@implementation Child
-(id)init
{
    if(self = [super init])
    {
        //启动定时器
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(change) userInfo:nil repeats:YES];
        _hapyValue = 100;
        _age = 1;
    }
    return self;
}
-(void)change
{
    
    
 
    self.hapyValue --;
    self.age ++;
    if(_age > 10)
    {
        //发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ageNotifition" object:[NSNumber numberWithInteger:_age]];
    }

}
@end
