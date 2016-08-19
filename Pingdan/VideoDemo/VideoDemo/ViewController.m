//
//  ViewController.m
//  VideoDemo
//
//  Created by chenguangjiang on 14-6-13.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "AVPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,AVCaptureVideoDataOutputSampleBufferDelegate>

@end

@implementation ViewController
{
    NSString *_videoPath;
    AVCaptureSession *session;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.backgroundColor =[ UIColor blackColor];
    [but setTitle:@"录像" forState:UIControlStateNormal];
    but.frame = CGRectMake(50, 50, 100, 100);
    
    [but addTarget:self action:@selector(recordAct) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    but2.backgroundColor =[UIColor blueColor];
    [but2 setTitle:@"播放" forState:UIControlStateNormal];
    but2.frame = CGRectMake(50, 200, 100, 100);
    [but2 addTarget:self action:@selector(playAct) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
    
    
    UIButton *but3 = [UIButton buttonWithType:UIButtonTypeCustom];
    but3.backgroundColor =[UIColor blueColor];
    [but3 setTitle:@"视频转图片" forState:UIControlStateNormal];
    but3.frame = CGRectMake(50, 350, 100, 100);
    [but3 addTarget:self action:@selector(setupCaptureSession) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but3];
    
    UIButton *but4 = [UIButton buttonWithType:UIButtonTypeCustom];
    but4.backgroundColor =[UIColor blueColor];
    [but4 setTitle:@"视关闭" forState:UIControlStateNormal];
    but4.frame = CGRectMake(200, 350, 100, 100);
    [but4 addTarget:self action:@selector(closeAct) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but4];
}
-(void)recordAct
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
-(void)playAct
{
    AVPlayerViewController *player = [[AVPlayerViewController alloc]initWithNibName:@"AVPlayerViewController" bundle:nil];
    
    
    
    
    
    player.videoPath = _videoPath;
  

    [self presentViewController:player animated:YES completion:nil];
    

}

-(void)closeAct
{
    [session stopRunning];
}

//代理方法
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

- (void)setupCaptureSession
{
    NSError *error = nil;
    
    // Create the session
    session = [[AVCaptureSession alloc] init] ;
    
    // Configure the session to produce lower resolution video frames, if your
    // processing algorithm can cope. We'll specify medium quality for the
    // chosen device.
    session.sessionPreset = AVCaptureSessionPresetMedium;
    
    // Find a suitable AVCaptureDevice
    AVCaptureDevice *device = [AVCaptureDevice
                               defaultDeviceWithMediaType:AVMediaTypeVideo];//这里默认是使用后置摄像头，你可以改成前置摄像头
    
    // Create a device input with the device and add it to the session.
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device
                                                                        error:&error];
    if (!input) {
        // Handling the error appropriately.
    }
    [session addInput:input];
    
    // Create a VideoDataOutput and add it to the session
    AVCaptureVideoDataOutput *output = [[AVCaptureVideoDataOutput alloc] init];
    [session addOutput:output];
    
    // Configure your output.
    dispatch_queue_t queue = dispatch_queue_create("myQueue", NULL);
    [output setSampleBufferDelegate:self queue:queue];
  
    
    // Specify the pixel format
    output.videoSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                            [NSNumber numberWithInt:kCVPixelFormatType_32BGRA], kCVPixelBufferPixelFormatTypeKey,
                            [NSNumber numberWithInt: 320], (id)kCVPixelBufferWidthKey,
                            [NSNumber numberWithInt: 240], (id)kCVPixelBufferHeightKey,
                            nil];
    
    AVCaptureVideoPreviewLayer* preLayer = [AVCaptureVideoPreviewLayer layerWithSession: session];
    //preLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    preLayer.frame = CGRectMake(0, 0, 320, 240);
    preLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:preLayer];
    // If you wish to cap the frame rate to a known value, such as 15 fps, set
    // minFrameDuration.
    output.minFrameDuration = CMTimeMake(1, 15);
    
    // Start the session running to start the flow of data
    [session startRunning];
    
    
    
    // Assign session to an ivar.
    //[self setSession:session];
}

//视频不关闭就会一直调用
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection
{
    UIImage *image = [self imageFromSampleBuffer:sampleBuffer];
   // NSData *data = UIImageJPEGRepresentation(image, 0.5);//0.5表示生成的质量
    NSLog(@"%@",image);
    
}
- (UIImage *)imageFromSampleBuffer:(CMSampleBufferRef) sampleBuffer
{
    // Get a CMSampleBuffer's Core Video image buffer for the media data
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    // Lock the base address of the pixel buffer
    CVPixelBufferLockBaseAddress(imageBuffer, 0);
    
    // Get the number of bytes per row for the pixel buffer
    void *baseAddress = CVPixelBufferGetBaseAddress(imageBuffer);
    
    // Get the number of bytes per row for the pixel buffer
    size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
    // Get the pixel buffer width and height
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    
    // Create a device-dependent RGB color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // Create a bitmap graphics context with the sample buffer data
    CGContextRef context = CGBitmapContextCreate(baseAddress, width, height, 8,
                                                 bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
    // Create a Quartz image from the pixel data in the bitmap graphics context
    CGImageRef quartzImage = CGBitmapContextCreateImage(context);
    // Unlock the pixel buffer
    CVPixelBufferUnlockBaseAddress(imageBuffer,0);
    
    // Free up the context and color space
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    // Create an image object from the Quartz image
    //UIImage *image = [UIImage imageWithCGImage:quartzImage];
    UIImage *image = [UIImage imageWithCGImage:quartzImage scale:1.0f orientation:UIImageOrientationRight];
    
    // Release the Quartz image
    CGImageRelease(quartzImage);
    
    return (image);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
