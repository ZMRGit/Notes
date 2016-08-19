//
//  UIViewController1ViewController.m
//  XmppDemo
//
//  Created by chenguangjiang on 14-8-5.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "UIViewController1ViewController.h"

@interface UIViewController1ViewController ()<UIWebViewDelegate,UIGestureRecognizerDelegate,UIScrollViewDelegate>
{
    UIWebView *_webView;
    
}
@end

@implementation UIViewController1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"TestDemo";
    

    
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 420)];
    
    NSURL *url= [NSURL URLWithString:@"http://m.baidu.com/from=1099a/bd_page_type=1/ssid=0/uid=0/baiduid=52556939AA55BFC7294298FF241C723A/w=0_10_%E6%A0%A1%E8%8A%B1%E7%9A%84%E8%B4%B4%E8%BA%AB%E9%AB%98%E6%89%8B/t=zbios/l=1/tc?ref=www_zbios&pu=sz%401320_480%2Ccuid%40E8F691DEA8B8336F3AB6311B38D196BAAB29AC4EEFNJPKEDSIG%2Ccua%40640_1136_iphone_5.4.0.0_0%2Ccut%40iPhone6%252C2_7.1.2%2Cosname%40baiduboxapp%2Cctv%401%2Ccfrom%401099a%2Ccsrc%40app_box_txt%2Cta%40zbios_1_7.1_6_%2Cusm%400&lid=7935916086309819341&order=1&fm=alnv_book&tj=wise_novel_book_1_0_10_title&sec=40488&di=83492d8dec961a4a&bdenc=1&nsrc=IlPT2AEptyoA_yixCFOxXnANedT62v3IGtiTNCVUB8SxokDyqRLrIxEtRD0fQGqPZpLRxWq4aNwYwn0wRjIz7aZ2tK6nsmoh88XfgPruw2PKCBVdfhZmPMHUS7VrtOTam3cvdt2yF1EzAGcR8rS6t3stfQD3qBZwkx8Yr7vkhq_QYoT-2JPNz9SlOplMHyGsDdjEcdaoqHdRGZfvA2WhHoC_na"];
 
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSString *urlstring = [NSString stringWithContentsOfFile:[self urlString] encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",urlstring);
   if(urlstring != nil)
   {
       if(urlstring.length != 0)
       {
    
           request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlstring]];
           
       }
   }
    

    _webView.scrollView.delegate = self;
    

    [_webView loadRequest:request];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    UIBarButtonItem *but = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = but;
    UIBarButtonItem *rightBut = [[UIBarButtonItem alloc]initWithTitle:@"首页" style:UIBarButtonItemStyleBordered target:self action:@selector(goHome)];
    self.navigationItem.rightBarButtonItem = rightBut;
    UIButton *goBack = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *forWard = [UIButton buttonWithType:UIButtonTypeCustom];
    goBack.frame = CGRectMake(0, 400,40,20);
    forWard.frame = CGRectMake(280, 400, 40, 20);
    goBack.backgroundColor = [UIColor blueColor];
    forWard.backgroundColor = [UIColor redColor];
    [goBack setTitle:@"后退" forState:UIControlStateNormal];
    [forWard setTitle:@"前进" forState:UIControlStateNormal];
    [goBack addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [forWard addTarget:self action:@selector(forWard) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goBack];
    [self.view addSubview:forWard];
    
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 420)];
    imageView.image =[UIImage imageNamed:@""];
    imageView.alpha = 0.5;
    [self.view addSubview:imageView];
    
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)goBack
{
    [_webView goBack];
}
-(void)forWard
{
    [_webView goForward];
}
-(void)goHome
{
    NSURL *url= [NSURL URLWithString:@"http://m.baidu.com/from=1099a/bd_page_type=1/ssid=0/uid=0/baiduid=52556939AA55BFC7294298FF241C723A/w=0_10_%E6%A0%A1%E8%8A%B1%E7%9A%84%E8%B4%B4%E8%BA%AB%E9%AB%98%E6%89%8B/t=zbios/l=1/tc?ref=www_zbios&pu=sz%401320_480%2Ccuid%40E8F691DEA8B8336F3AB6311B38D196BAAB29AC4EEFNJPKEDSIG%2Ccua%40640_1136_iphone_5.4.0.0_0%2Ccut%40iPhone6%252C2_7.1.2%2Cosname%40baiduboxapp%2Cctv%401%2Ccfrom%401099a%2Ccsrc%40app_box_txt%2Cta%40zbios_1_7.1_6_%2Cusm%400&lid=7935916086309819341&order=1&fm=alnv_book&tj=wise_novel_book_1_0_10_title&sec=40488&di=83492d8dec961a4a&bdenc=1&nsrc=IlPT2AEptyoA_yixCFOxXnANedT62v3IGtiTNCVUB8SxokDyqRLrIxEtRD0fQGqPZpLRxWq4aNwYwn0wRjIz7aZ2tK6nsmoh88XfgPruw2PKCBVdfhZmPMHUS7VrtOTam3cvdt2yF1EzAGcR8rS6t3stfQD3qBZwkx8Yr7vkhq_QYoT-2JPNz9SlOplMHyGsDdjEcdaoqHdRGZfvA2WhHoC_na"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSString *urlStr = [NSString stringWithFormat:@"%@",webView.request.URL];
 
    [urlStr writeToFile:[self urlString] atomically:YES encoding:NSUTF8StringEncoding error:nil];
    

    

//    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    [webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '50%'"];
}
-(NSString *)urlString
{
    NSString *path=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    return [path stringByAppendingPathComponent:@"urlString.plist"];
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{


    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
