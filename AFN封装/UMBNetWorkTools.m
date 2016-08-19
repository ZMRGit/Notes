//
//  UMBNetWorkTools.m
//  UMB
//
//  Created by Aby.zhou on 15/12/5.
//  Copyright © 2015年 aby.zhou. All rights reserved.
//

#import "UMBNetWorkTools.h"

@implementation UMBNetWorkTools
+(UMBNetWorkTools*)defaultTool;
{
    static UMBNetWorkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //set base url
        NSURL *url = [NSURL URLWithString:@"http://c.m.163.com/"];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        instance = [[self alloc]initWithBaseURL:url sessionConfiguration:config];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return instance;
}
+(UMBNetWorkTools*)defaultWithoutBaseTool;
{
    static UMBNetWorkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *url = [NSURL URLWithString:@""];
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        instance = [[self alloc]initWithBaseURL:url sessionConfiguration:config];
        
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return instance;
}
@end
