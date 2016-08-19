//
//  NSString+ValiteMail.h
//  类目
//
//  Created by chenguangjiang on 14-9-1.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

//局限性  会覆盖原始的方法  不能扩展实例属性

@interface NSString (ValiteMail)
-(BOOL)validateEmail;
@end
