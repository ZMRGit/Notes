//
//  KFModels.h
//  AppKeFuIMSDK
//
//  Created by jack on 13-9-25.
//  Copyright (c) 2013年 appkefu.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface KFMessageContent : NSObject

@property (nonatomic, retain) id         image;
@property (nonatomic, retain) NSString * name;
@property (nonatomic)         BOOL       isSent;
@property (nonatomic, retain) NSDate   * sentDate;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSString * soundUrl;

@end

////////////////////////////
@interface KFConversationItem : NSObject

@property (nonatomic, strong) NSString * username;

@property (nonatomic, strong) NSDate * mostRecentMessageTimestamp;
@property (nonatomic, strong) NSString * mostRecentMessageBody;
@property (nonatomic, strong) NSNumber * mostRecentMessageOutgoing;

@property (nonatomic, strong) NSString * streamBareJidStr;

@end

////////////////////////////
@interface KFMessageItem : NSObject

@property (nonatomic, strong) NSString * username;  // 

@property (nonatomic, strong) NSString * body;

@property (nonatomic, strong) NSNumber * outgoing;
@property (nonatomic, assign) BOOL isOutgoing;       

@property (nonatomic, strong) NSDate * timestamp;

@property (nonatomic, strong) NSString * streamBareJidStr;

@end

////////////////////////////
@interface KFFriendItem : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *relation;

@end

////////////////////////////
@interface KFFollowedItem : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *relation;

@end

////////////////////////////
@interface KFFanItem : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *relation;

@end


////////////////////////////
@interface KFModels : NSObject

@end























