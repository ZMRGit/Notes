//
//  AppDelegate.h
//  XmppDemo
//
//  Created by chenguangjiang on 14-7-15.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPPFramework.h"
#import "XMPPvCardTemp.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,XMPPStreamDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic,readonly) XMPPStream *xmppStream;
@property (strong ,nonatomic ,readonly)XMPPvCardTempModule *xmppvCardTempModule;//电子名片
@property (strong ,nonatomic,readonly)XMPPRoster *xmppRoster;
@property (nonatomic ,strong ,readonly)XMPPRosterCoreDataStorage *xmppRosterCoreDataStorage;

@end
