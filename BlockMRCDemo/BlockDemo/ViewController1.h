//
//  ViewController1.h
//  BlockDemo
//
//  Created by chenguangjiang on 14-9-29.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  void (^Blk)(void);
@interface ViewController1 : UIViewController
@property (nonatomic,assign)Blk blk;
- (IBAction)doAct;
@end
