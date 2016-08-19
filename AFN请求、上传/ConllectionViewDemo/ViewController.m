//
//  ViewController.m
//  ConllectionViewDemo
//
//  Created by chenguangjiang on 14-9-3.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "SBJson.h"
#import "UIImageView+AFNetworking.h"
#import "ViewController1.h"


@interface ViewController ()<NSURLSessionDataDelegate,NSURLSessionDelegate,NSURLSessionDownloadDelegate,NSURLSessionTaskDelegate>
{
    AFHTTPRequestOperation *_operation;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [_startBut setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 50, 0)];
    
    
    //[self loadData];
    [self postImage];
}
-(void)postImage
{
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"8d800bc614ae565ea87d2563958e4fd6",@"tokenStr", nil];
    UIImage *image = [UIImage imageNamed:@"BookShelfCell.png"];
    NSData *data = UIImagePNGRepresentation(image);

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html",@"multipart/form-data", nil];
  
    
     AFHTTPRequestOperation *operation = [manager POST:@"http://42.96.191.62:8080/qdnz/api/user/uploadicon" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
         
         
         [formData appendPartWithFileData:data name:@"iconFile" fileName:@"png" mimeType:@"multipart/form-data"];
  
     } success:^(AFHTTPRequestOperation *operation, id responseObject) {
         
         NSLog(@"%@",[operation  responseString]);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         
         NSLog(@"%@",error.description);
     }];

    

    [operation start];
    
    
    
    
    
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"8d800bc614ae565ea87d2563958e4fd6",@"tokenStr", nil];
//    UIImage *image =[UIImage imageNamed:@"BookShelfCell"];
//    
//    
//    NSData *data= UIImagePNGRepresentation(image);
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html",@"multipart/form-data",nil];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.requestSerializer.timeoutInterval = 45;
//
//    NSMutableURLRequest *request = [manager.requestSerializer multipartFormRequestWithMethod:@"POST" URLString:@"http://42.96.191.62:8080/qdnz/api/user/uploadicon" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//              [formData appendPartWithFileData:data name:@"iconFile" fileName:@"png" mimeType:@"multipart/form-data"];
//    } error:nil];
//    
//    AFHTTPRequestOperation *op = [manager HTTPRequestOperationWithRequest:request
//                                                                                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                                                                                           
//                                                                                           NSLog(@"%@",[operation responseString]);
//                                                                                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                                                                                           NSLog(@"%@",[operation responseString]);
//                                                                                           NSLog(@"%@",error.description);
//                                                                                       } ];
//
//   
//
//    
//    
//    [op start];
   
    
    
    
 
}

-(void)loadData
{
    NSURL *url = [NSURL URLWithString:@"http://123.57.36.238:8080/cloud/user/update/9a7dc62ca82bbeaf0fd0b87de0a205c2?id=16177&password=abcd123&creditNo=45467564949444&mobile=1313887844647&staffName=嘻嘻&birthday=2014-11-20&sex=女&email=297854263&creditType=0"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
   
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData* data=[html dataUsingEncoding:NSUTF8StringEncoding];
        id dict=[NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        NSLog(@"获取到的数据为：%@",dict);
        
        //第二种解析方法
        NSLog(@"%@",[operation.responseString JSONValue]);
  
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    [operation start];
//    NSOperationQueue *queue =[[NSOperationQueue alloc]init];
//    [queue addOperation:operation];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//下载文件 旧方法
- (IBAction)next {
    ViewController1 *vc = [[ViewController1 alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)download:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"https://github.com/AFNetworking/afnetworking.com/archive/master.zip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    
    
    
    NSString *document = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *path = [document stringByAppendingPathComponent:@"/master.zip"];
    _operation.outputStream = [NSOutputStream outputStreamToFileAtPath:path append:NO];
    
    //监听下载进度
    //byt 当前传递的字节数
    //totalbytRead 已经传递的总字节数
    //totalbytExpectedToRead 总长度
    
   __block ViewController *blockSelf = self;
    [_operation setDownloadProgressBlock:^(NSUInteger byt,long long totalbytRead,long long totalbytExpectedToRead){
        
    
        blockSelf.prosView.progress = (double)totalbytRead/totalbytExpectedToRead;
        
    }];
    [_operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载完成") ;
        
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    
    [_operation start];
}

//下载 新方法  iOS7能用
//-(void)downfile
//{
//    
//    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
//    
//    NSURL *URL = [NSURL URLWithString:@"http://pl.youku.com/playlist/m3u8?ts=1384952122&keyframe=1&vid=XNzcyNTQ3MTY4&type=mp4"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
//    
//    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
//        NSURL *documentsDirectoryPath = [NSURL fileURLWithPath:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]];
//        return [documentsDirectoryPath URLByAppendingPathComponent:[targetPath lastPathComponent]];
//    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
//        NSLog(@"File downloaded to: %@", filePath);
//    }];
//    [downloadTask resume];
//}
- (IBAction)pause:(id)sender {
    [_operation pause];

}

- (IBAction)resume {
    [_operation resume];
}
@end
