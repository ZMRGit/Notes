//
//  AppKeFuIMSDK.h
//  AppKeFuIMSDK
//
//  Created by jack on 13-9-20.
//  Copyright (c) 2013年 appkefu.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KFModels.h"

#define XMPPUSERNAME                        @"appkefu_username"
#define XMPPPASSWORD                        @"appkefu_password"

//文本消息通知
#define NEW_TEXT_MESSAGE_RECEIVED           @"appkefu_new_text_message_received"

//图片消息通知
#define NEW_IMAGE_MESSAGE_RECEIVED          @"appkefu_new_image_message_received"

//语音消息通知
#define NEW_VOICE_MESSAGE_RECEIVED          @"appkefu_new_voice_message_received"

//登录成功通知
#define IS_LOGIN_SUCCEED_NOTIFICATION       @"is_appkefu_login_succeed_notification"

//注册成功通知
#define IS_REGISTER_SUCCEED_NOTIFICATION    @"is_appkefu_register_succeed_notification"


@interface AppKeFuIMSDK : NSObject

/*
 配置说明：
 选中target中的Build Settings:
 1. Other Linker Flags 添加 -all_load -cclib -lstdc++
 2. Header Search Paths 添加 “/usr/include/libxml2”
 */

/*
 使用说明(注意事项)：
 一.修改Build Settings:
    1.修改Build Active Architechture Only为Yes
    2.如果出现[DDXMLElement compactXMLString]:unrecognized selector的情况，请确认现在target，
 在Build Settings的Other Linker Flags选项中添加-all_load
 
 */

+(AppKeFuIMSDK*)sharedInstance;

//初始化
-(BOOL)initWithAppkey:(NSString*)appkey;

//注册
-(void) registerWithUsername:(NSString*)username password:(NSString*)password error:(NSError*)error;

//(系统自动分配UUID登录)
-(void) login;

//登录
-(void) loginWithUsername:(NSString*)username password:(NSString*)password error:(NSError*)error;

//获取已经登录的用户名
- (NSString*) getLoginedInUsername;

//判断连接是否正常
-(BOOL) isConnected;

//上线
-(void) goOnline;

//离线
-(void) goOffline;

//聊天/咨询客服
-(void) chatWithName:(NSString*)name;

//发送文字消息
-(void) sendTextMessage:(NSString*)content to:(NSString*)username;

//发送图片
-(void) sendImageMessage:(NSData*)imageData to:(NSString*)username;

//发送语音
//-(void) sendVoiceMessage:(NSData*)voiceData to:(NSString*)username;

//
-(void) beginRecordingVoiceTo:(NSString*)username;
-(void) stopRecordingAndSendVoiceTo:(NSString*)username;
-(void) cancelRecording;
-(void) playSoundWithPath:(NSString*)urlPath;

//
//-(void) showRecordingHUD:(UIView*)view;
//-(void) hideRecordingHUD:(UIView*)view;


//接收消息通知：文字、图片、语音


//
- (void)showBubbleViewController:(UINavigationController *) navController withKefuUsername:(NSString*)kefuUsername;

//
- (void)showWeixinViewController:(UINavigationController *)navController withKefuUsername:(NSString *)kefuUsername;



//添加好友
- (void)addFriend:(NSString*)username;

//好友列表
- (NSMutableArray*) getFriendsList;
- (NSMutableArray*) getFollowedsList;
- (NSMutableArray*) getFansList;

//历史消息记录
- (NSMutableArray*) getConversationList;
//删除与username的会话
- (void) deleteConversationWith:(NSString*)username;
//获取与username的所有消息记录
- (NSMutableArray*) getMessageWith:(NSString*)username;
//
- (void) deleteMessageWith:(NSString*)username;


//个人资料
- (void) setNickName:(NSString*)nickname;

///
- (NSString*)getStatus;
- (NSString*)getMSignature;
- (NSString*)getJob;
- (NSString*)getCompany;
- (NSString*)getSchool;
- (NSString*)getInterest;
- (NSString*)getDailyLocation;
- (NSString*)getPersonalNote;

- (void)setStatus:(NSString*)status;
- (void)setMSignature:(NSString*)signature;
- (void)setJob:(NSString*)job;
- (void)setCompany:(NSString*)company;
- (void)setSchool:(NSString*)school;
- (void)setInterest:(NSString*)interest;
- (void)setDailyLocation:(NSString*)dailyLocation;
- (void)setPersonalNote:(NSString*)personalnote;


//好友个人资料
- (NSString*)getStatusOf:(NSString*)username;
- (NSString*)getMSignatureOf:(NSString*)username;
- (NSString*)getJobFor:(NSString*)username;
- (NSString*)getCompanyOf:(NSString*)username;
- (NSString*)getSchoolOf:(NSString*)username;
- (NSString*)getInterestOf:(NSString*)username;
- (NSString*)getDailyLocationOf:(NSString*)username;
- (NSString*)getPersonalNoteOf:(NSString*)username;


//拉黑


//黑名单列表


//群聊(稍后放出)


//don't use
- (void)sendImage:(NSString*)username imageData:(NSData*)imageData;
- (void)sendSound:(NSString*)username soundData:(NSData*)soundData;

- (void)persistImage:(NSString*)username image:(UIImage*)image isSent:(BOOL)isSent;
- (void)persistMessage:(NSString*)username msg:(NSString*)msgStr isSent:(BOOL)isSent;
- (void)persistSound:(NSString *)username sound:(NSString *)soundPath isSent:(BOOL)isSent;

//判断kefuUsername是否在线
- (BOOL)isKefuOnlineSync:(NSString*) kefuUsername withAppKey:(NSString*)appKey;

//登出
- (void)logout;

@end










































