//
//  Dog.h
//  BlockDemo
//
//  Created by chenguangjiang on 14-9-26.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    NSTimer *_timer;
    NSInteger _breakCount;
    void (^dogBlock) (Dog *dog , int breakcount);
}
@property(nonatomic,assign)NSInteger ID;
-(void)setblock:(void (^) (Dog *, int ))block;
@end
