//
//  FirstViewController.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-5.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "FirstViewController.h"
#import <CoreMedia/CoreMedia.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "AVPlayerViewController.h"
#import "APService.h"
#import "ASIHTTPRequest.h"
#import "AppKeFuIMSDK.h"

@interface FirstViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,ASIHTTPRequestDelegate,ASICacheDelegate>
@property(nonatomic,strong)NSString * videoPath;
@end

@implementation FirstViewController

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

    
    UIButton *navBut = [UIButton buttonWithType:UIButtonTypeInfoLight];
    navBut.frame = CGRectMake(200, 0, 50, 50);

    [self.view addSubview:navBut];
    
    
	self.view.backgroundColor = [UIColor redColor];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(100, 100, 100, 100);
    but.backgroundColor = [UIColor blackColor];
    [but addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    but1.frame = CGRectMake(100, 200, 100, 100);
    but1.backgroundColor = [UIColor blueColor];
    [but1 addTarget:self action:@selector(action1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    

    
   
 
}


-(void)action
{
    [ThemeManger shareInstance].themeName = @"blue";
      [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNofivation object:nil];
    //[self recordVideo];
    
}
-(void)action1
{
//   //相关属性
//    NSFileManager *fileManger = [NSFileManager defaultManager];
//    
//    NSDictionary *dic = [fileManger attributesOfItemAtPath:_videoPath error:nil];
//    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:[NSURL fileURLWithPath:_videoPath] options:nil];

    
    AVPlayerViewController *player = [[AVPlayerViewController alloc]initWithNibName:@"AVPlayerViewController" bundle:nil];
    
    
    
    

    player.videoPath = _videoPath;
    NSLog(@"%@",_videoPath);
    //文件路径下的录像
    NSFileManager *fileManger = [NSFileManager defaultManager];
    NSString *path = @"/private/var/mobile/Applications/4100B564-5979-4B0B-91E3-031775AE9870/tmp";
    NSArray  *arr = [fileManger  directoryContentsAtPath:path];
    NSLog(@"%@",arr);
    
    float f = [self fileSizeAtPath:path];
    NSLog(@"%f",f);
    
    [self presentViewController:player animated:YES completion:nil];
    
    
    

    

  }
//打开摄像头
- (void) recordVideo
{
    UIImagePickerController *picker = [[UIImagePickerController alloc ]init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        NSArray *temp_MediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        picker.mediaTypes = temp_MediaTypes;
        picker.delegate = self;
        picker.allowsEditing = YES;
    }
    [self presentViewController:picker animated:YES completion:nil];
    
    
}

//下面两个函数是遵守 UIImagePickerControllerDelegate这个协议所实现的类.这样就能够完整的实现,获取照片或者视频,然后写入文件的过程

//用data保存
//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
//{
//    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
//    
//    BOOL success;
//    NSFileManager *fileManger = [NSFileManager defaultManager];
// 
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory  = [paths objectAtIndex:0];
//    if([mediaType isEqualToString:@"public.image"])
//    {
//        UIImage *image = [info objectForKey:@"UIImagePickerControllerEditedImage"];
//        NSLog(@"found an image");
//
//        NSString *imageFile = [documentsDirectory stringByAppendingPathComponent:@"temp.jpg"];
//        success = [fileManger fileExistsAtPath:imageFile];
//        if(success)
//        {
//            success = [fileManger removeItemAtPath:imageFile error:nil];
//            
//        }
//    
//        [UIImageJPEGRepresentation(image, 1.0f) writeToFile:imageFile atomically:YES];
//        
//    }
//    else if([mediaType isEqualToString:@"public.movie"])
//    {
//        NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
//        NSLog(@"%@",videoURL);
//        NSLog(@"found a video");
//        NSData *videoData = [NSData dataWithContentsOfURL:videoURL];
//        NSLog(@"%@",videoData);
//        
//        NSString *videoFile = [documentsDirectory stringByAppendingPathComponent:@"temp.mov"];
//        NSLog(@"%@",videoFile);
//        
//        success = [fileManger fileExistsAtPath:videoFile];
//        if(success)
//        {
//            success = [fileManger removeItemAtPath:videoFile error:nil];
//        }
//        [videoData writeToFile:videoFile atomically:YES];
//    }
//    
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    
//    
//}


//用媒体库保存
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //获取媒体类型
    NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    //判断是静态图像还是视频
   
    NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];

 
   _videoPath =  [url path];
    

    
    
   if([mediaType isEqualToString:@"public.movie"])
   {
       NSURL *mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
       
    //创建ALAssetsLibrary对象并将视频保存到媒体库
       ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc]init];
       
       [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:mediaURL completionBlock:^(NSURL *assetURL, NSError *error) {
           if (!error) {
               NSLog(@"captured video saved with no error.");
           }else
           {
               NSLog(@"error occured while saving the video:%@", error);
           }
       }];
  

   }
    
    [picker dismissViewControllerAnimated:self completion:nil];

   
}


//检测

- (BOOL) videoRecordingAvailable

{
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        
    {
        
        return NO;
        
    }
    
    return [[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera] containsObject:@"test.video"];
    
}


//读取文件大小
- (float) fileSizeAtPath:(NSString*) filePath{
    
    //
    //    NSData* data = [NSData dataWithContentsOfFile:[VoiceRecorderBaseVC getPathByFileName:_convertAmr ofType:@"amr"]];
    //    NSLog(@"amrlength = %d",data.length);
    //    NSString * amr = [NSString stringWithFormat:@"amrlength = %d",data.length];
    
    NSFileManager* manager = [NSFileManager defaultManager];
    
    if ([manager fileExistsAtPath:filePath]){
        
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize]/(1024.0*1024);
    }
    return 0;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
