//
//  Person.m
//  KVC_KVO
//
//  Created by chenguangjiang on 14-9-24.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "Person.h"

@implementation Person
-(NSString *)description
{
    
    NSString *s = [NSString stringWithFormat:@"name = %@",_name];
    return s;
}
-(void)setDog:(Dog *)dog
{
    if(_dog != dog)
    {
        [_dog release];
        _dog = [dog retain];
    }
    
}
-(NSString *)privateMethod
{
    return @"haha";
}
-(void)voidMethod
{
    NSLog(@"已访问");
}
-(NSString *)name
{
    return @"私有方法";
}


@end
