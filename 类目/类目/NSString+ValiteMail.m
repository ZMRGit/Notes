//
//  NSString+ValiteMail.m
//  类目
//
//  Created by chenguangjiang on 14-9-1.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "NSString+ValiteMail.h"

@implementation NSString (ValiteMail)
-(BOOL)validateEmail{
    NSRange rang = [self rangeOfString:@"@"];
    if(rang.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}
@end
