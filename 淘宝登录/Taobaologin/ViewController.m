//
//  ViewController.m
//  Taobaologin
//
//  Created by chenguangjiang on 14-10-21.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import <CFNetwork/CFNetwork.h>
#import <WebKit/WebKit.h>
@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *taobaologin = @"https://oauth.taobao.com/authorize?response_type=token&client_id=12241057&view=wap";
    NSString *taobaoOrder = @"http://h5.m.taobao.com/awp/mtb/mtb.htm?#!/awp/mtb/olist.htm?sta=4";
	NSURL *url = [NSURL URLWithString:taobaoOrder];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_myWebView loadRequest:request];
    _myWebView.scalesPageToFit = YES;
    _myWebView.delegate = self;

    
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
   // NSLog(@"%@",request.URL.absoluteString);
 
  // NSLog(@"%@",[self jiexi:@"taobao_user_id" webaddress:[request.URL absoluteString]]) ;
    return YES;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerText"];
   // NSLog(@"%@",webView.request.URL.absoluteString);
    NSLog(@"%@",title);
    if([title isEqualToString:@"您需要登录才能继续访问关闭"]){
        [_myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://login.m.taobao.com/login.htm?tpl_redirect_url=https%3A%2F%2Fh5.m.taobao.com%2Fmlapp%2Folist.html"]]];
    }
}
-(NSString *)jiexi:(NSString *)CS webaddress:(NSString *)webaddress
{
    NSError *error;
    NSString *regTags=[[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)",CS];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:webaddress options:0 range:NSMakeRange(0, [webaddress length])];
    for (NSTextCheckingResult *match in matches) {
        NSString *tagValue = [webaddress substringWithRange:[match rangeAtIndex:2]];
        return tagValue;
    }
    return @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
