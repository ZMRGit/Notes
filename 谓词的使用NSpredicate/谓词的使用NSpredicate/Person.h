//
//  Person.h
//  谓词的使用NSpredicate
//
//  Created by chenguangjiang on 14-9-24.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSUInteger age;
+(id)personWithName:(NSString *)name andAge:(NSUInteger)age;
@end
