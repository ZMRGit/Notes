//
//  Dog.m
//  大杂烩
//
//  Created by chenguangjiang on 14-9-20.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(NSString *)setDogName:(NSInteger)age name:(NSString *)str
{
    return [NSString stringWithFormat:@"%@%d",str,age];
}
@end
