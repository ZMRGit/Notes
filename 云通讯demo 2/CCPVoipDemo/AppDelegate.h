/*
 *  Copyright (c) 2013 The CCP project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a Beijing Speedtong Information Technology Co.,Ltd license
 *  that can be found in the LICENSE file in the root of the web site.
 *
 *                    http://www.cloopen.com
 *
 *  An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */
#define kKeyboardBtnpng             @"call_interface_icon_01.png"
#define kKeyboardBtnOnpng           @"call_interface_icon_01_on.png"
#define kHandsfreeBtnpng            @"call_interface_icon_03.png"
#define kHandsfreeBtnOnpng          @"call_interface_icon_03_on.png"
#define kMuteBtnpng                 @"call_interface_icon_02.png"
#define kMuteBtnOnpng               @"call_interface_icon_02_on.png"

#import <UIKit/UIKit.h>

int globalcontactsChanged;
int globalContactID;
int contactOptState;

@class ModelEngineVoip;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) ModelEngineVoip *modeEngineVoip;
@property (retain, nonatomic) NSDateFormatter *dateFormatter;
//用于输出日志
-(void)printLog:(NSString*)log;
-(void)logout;
@end

