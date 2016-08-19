//
//  ViewController.m
//  ShareSDKDemo
//
//  Created by chenguangjiang on 14-9-19.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	id<ISSShareActionSheetItem>myItem = [ShareSDK shareActionSheetItemWithTitle:@"自定义平台" icon:[UIImage imageNamed:@"28_logo"] clickHandler:^{
        NSLog(@"hahahah");
    }];
    NSArray *shareList = [ShareSDK customShareListWithType:myItem, nil];
    //定义容器
    id<ISSContainer> container = [ShareSDK container];
    
 
    [container setIPhoneContainerWithViewController:self];
    
    
    //定义分享内容
    id<ISSContent> publishContent = nil;
    
    NSString *contentString = @"This is a sample";
    NSString *titleString   = @"title";
    NSString *urlString     = @"http://www.ShareSDK.cn";
    NSString *description   = @"Sample";
    
    publishContent = [ShareSDK content:contentString
                        defaultContent:@""
                                 image:nil
                                 title:titleString
                                   url:urlString
                           description:description
                             mediaType:SSPublishContentMediaTypeText];
    
    //定义分享设置
    id<ISSShareOptions> shareOptions = [ShareSDK simpleShareOptionsWithTitle:@"分享内容" shareViewDelegate:nil];
    
    [ShareSDK showShareActionSheet:container
                         shareList:shareList
                           content:publishContent
                     statusBarTips:NO
                       authOptions:nil
                      shareOptions:shareOptions
                            result:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)share {
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"ShareSDK"  ofType:@"jpg"];
    
    //构造分享内容
    id<ISSContent> publishContent = [ShareSDK content:@"分享内容"
                                       defaultContent:@"默认分享内容，没内容时显示"
                                                image:[ShareSDK imageWithPath:imagePath]
                                                title:@"ShareSDK"
                                                  url:@"http://www.sharesdk.cn"
                                          description:@"这是一条测试信息"
                                            mediaType:SSPublishContentMediaTypeNews];
    
    [ShareSDK showShareActionSheet:nil
                         shareList:nil
                           content:publishContent
                     statusBarTips:YES
                       authOptions:nil
                      shareOptions: nil
                            result:^(ShareType type, SSResponseState state, id<ISSPlatformShareInfo> statusInfo, id<ICMErrorInfo> error, BOOL end) {
                                if (state == SSResponseStateSuccess)
                                {
                                    NSLog(@"分享成功");
                                }
                                else if (state == SSResponseStateFail)
                                {
                                    NSLog(@"分享失败,错误码:%d,错误描述:%@", [error errorCode], [error errorDescription]);
                                }
                            }];
    
    
}
@end
