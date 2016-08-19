//
//  ThemeManger.h
//  Pingdan
//
//  Created by chenguangjiang on 14-5-6.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#define kThemeDidChangeNofivation @"kThemeDidChangeNofivation"

@interface ThemeManger : NSObject
@property(nonatomic,retain)NSString *themeName;//当前使用主题名称
@property(nonatomic,retain)NSDictionary *themesPlist;

+(ThemeManger *)shareInstance;
-(UIImage *)getThemeImage:(NSString *)imageName;
@end
