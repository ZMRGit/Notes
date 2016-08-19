//
//  Person.m
//  谓词的使用NSpredicate
//
//  Created by chenguangjiang on 14-9-24.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "Person.h"

@implementation Person
+(id)personWithName:(NSString *)name andAge:(NSUInteger)age
{
    Person *person = [[Person alloc]init];
    person.name = name;
    person.age = age;
    return  [person autorelease];
}
-(NSString *)description
{
    NSString *s = [NSString stringWithFormat:@"name=%@ age=%lu",_name,(unsigned long)_age];
    return s;
}
- (void)dealloc
{
    [super dealloc];
    [_name release];
}
@end
