//
//  CONST.h
//  Keanr
//
//  Created by 方廷超 on 14-7-14.
//  Copyright (c) 2014年 方廷超. All rights reserved.
//

#ifndef Keanr_CONST_h
#define Keanr_CONST_h

#define _IOS_VERSION_UI7 ([[[UIDevice currentDevice] systemVersion] floatValue])

#define IOS7 [[[UIDevice currentDevice] systemVersion]floatValue]>=7

#define BACK_ICON_NAME @"back.png"

//大小有关
#define kScreenHeight [UIScreen mainScreen].bounds.size.height //屏幕的高度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width //屏幕的宽度
#define kNavigationHeight 64
#define TEMP_WIDTH 7

//颜色有关
#define RGB(r,g,b,opaque) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:opaque]
#define RGBFULL(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define DEFAULTBACKCOLOR       RGB(154, 205, 50, 1)
#define NAVIGATIONBARCOLOR    RGB(154, 177, 110, 1)

#define CONTROLLER_COLOLOR_LIGHT RGB(236, 240, 243, 1)
#define LINECOLOR       [UIColor blackColor]

#define CUSTOM_BLACKCOLOR RGB(51, 51, 51, 1)
#define CUSTOM_WHITECOLOR RGB(255, 255, 255, 1)
#define CUSTOM_LINECOLOR RGB(204,204,204,1)

#define DARK_GRAY_COLOR RGB(100, 88, 77, 1)

#define TITLECOLOR RGB(9, 113, 179, 1)
#define YELLOWCOLOR RGB(255, 234, 0, 1)

//字体有关
#define FONTNAME(siz) [UIFont fontWithName:@"MicrosoftYaHei" size:siz]
#define FONTNAME_Helvetica(siz) [UIFont fontWithName:@"Helvetica" size:siz]
#define FONTNAME_HelveticaNeueLight(siz) [UIFont fontWithName:@"HelveticaNeue-Light" size:siz]
#define FONTNAME_HelveticaNeueBold(siz) [UIFont fontWithName:@"HelveticaNeue-Bold" size:siz]
#define FONTNAME_HelveticaNeueMedium(siz) [UIFont fontWithName:@"HelveticaNeue-Medium" size:siz]
#define FONTNAME_HelveticaNeueRegular(siz) [UIFont fontWithName:@"HelveticaNeue-Regular" size:siz]
#define  Font(f) [UIFont fontWithName:@"HelveticaNeue-Light" size:f]

//字符串格式化
#define STRING_FORMAT(str)     [[NSString stringWithFormat:@"%@",str] format]
#define STRING_FORMAT_SECOND(str,...)     [[NSString stringWithFormat:__VA_ARGS__] format]

//数字和字母
#define NUMBERS @"0123456789"//正则数字
#define ALPHABET NUMBERS@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"//正则数字加字母

//网络请求有关
#define CONNECT_ERROR_CODE 99999
#define CONNECT_WAIT_MSG @"加载中..."
#define CONNECT_ERROR_MSG @"加载页面错误"
#define CONNECT_NO_DATA_MSG @"没有数据"
#define CONNECT_NO_MORE_DATA_MSG @"没有更多数据"
#define SERVER_ERROR_MESSAGE @"服务器错误"

//缓存时间
#define ASI_CACHE_TIME 7*24*60*60
#define CONNECT_STORAGE_TIME 7*24*60*60

//默认图片
#define PLACEHODER_IMAGE [UIImage imageNamed:@"placeholder_video_ios@2x.png"]


#define MAX_CODE_LENGHT 6
#define MAX_PASSWORD_LENGHT 18
#define MAX_MOBILE_LENGHT 11
#define CODE_FAIL_MAG @"获取验证码失败"
#define INVALIAD_PASSWORD_MSG @"密码为6～18位数字或字母"
#define INVALID_MOBILE_MSG @"请输入有效的手机号码"

#endif
