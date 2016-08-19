//
//  Demo.h
//  BlockARCDemo
//
//  Created by chenguangjiang on 15-1-17.
//  Copyright (c) 2015年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef  void (^Blk)(void);
@interface Demo : NSObject
@property (nonatomic,copy)Blk blk;




@end
