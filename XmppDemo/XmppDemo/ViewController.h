//
//  ViewController.h
//  XmppDemo
//
//  Created by chenguangjiang on 14-7-15.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCDelegate.h"
@interface ViewController : UIViewController<VCDelegate>
@property (assign,nonatomic)id delegate;
@end
