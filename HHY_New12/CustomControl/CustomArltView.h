//
//  CustomArltView.h
//  BibleReader
//
//  Created by chenguangjiang on 15-1-26.
//  Copyright (c) 2015年 Dengchenglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void(^CompletionBlock) (BOOL finish);
typedef void(^DidClickBlock) (NSInteger buttonIndex);
@interface CustomArltView : NSObject<UIAlertViewDelegate>
+(CustomArltView *)customArlt;

-(void)showArltTitle:(NSString *)title onView:(UIView *)view;
-(void)showArltTitle:(NSString *)title onView:(UIView *)view completion:(CompletionBlock)block;

-(void)showAlertView:(UIAlertView *)alertView didClick:(DidClickBlock)block;

@end
