//
//  UMBNetWorkTools.h
//  UMB
//
//  Created by Aby.zhou on 15/12/5.
//  Copyright © 2015年 aby.zhou. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface UMBNetWorkTools : AFHTTPSessionManager


/**
    设置了Base Url的请求
 */
+(UMBNetWorkTools*)defaultTool;

/**
 未设置了Base Url的请求
 */
+(UMBNetWorkTools*)defaultWithoutBaseTool;




@end
