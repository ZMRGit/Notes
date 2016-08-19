//
//  Person.h
//  KVC_KVO
//
//  Created by chenguangjiang on 14-9-24.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject
{
    @private
    NSString *_name;
    Dog *_dog;
    NSInteger age;

}



@end
