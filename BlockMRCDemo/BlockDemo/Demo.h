//
//  Demo.h
//  BlockDemo
//
//  Created by chenguangjiang on 14-10-11.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef  void (^Blk)(void);


@interface Demo : NSObject
@property (nonatomic,copy)Blk blk;

-(void)printf;
@end
