//
//  Nurse.m
//  KVC_KVO
//
//  Created by chenguangjiang on 14-9-24.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "Nurse.h"

@implementation Nurse
-(id)initWithChild:(Child *)child
{
    if(self = [super init])
    {
        _child = [child retain];
        
        //KVO
        //小孩添加观察者为保姆 self时刻监听_child的hapyValue
        //实际上就是在监听set方法
        //NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew  属性的旧值和新值
        [_child addObserver:self forKeyPath:@"hapyValue" options:NSKeyValueObservingOptionOld |NSKeyValueObservingOptionNew context:NULL];
        
            [_child addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:NULL];

        
        
        //通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifition:) name:@"ageNotifition" object:nil];
        
    }
    return self;
}


//一旦hapyValue或者age属性被修改就会调用
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"%@",change);
    //kePath区分是哪个属性
    if([keyPath isEqualToString:@"age"])
    {
        NSLog(@"触发了age的set方法");
    }
    if([keyPath isEqualToString:@"hapyValue"])
    {
        NSLog(@"触发了hapyValue的set方法");
    }
}



-(void)notifition:(NSNotification *)notification
{
    NSLog(@"触发通知了 %@",notification.object);
}
- (void)dealloc
{
    [super dealloc];
    [_child release];
    //移除制定通知
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"ageNotifition" object:nil];
    //移除当前对象上所有的通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
