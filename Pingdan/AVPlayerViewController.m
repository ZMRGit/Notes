//
//  AVPlayerViewController.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-8.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "AVPlayerViewController.h"

@interface AVPlayerViewController ()

@end

@implementation AVPlayerViewController
{
    //声明一个媒体
    AVPlayerItem *myMovie;
    //声明一个播放器
    AVPlayer *myPlayer;
}
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
    
  
    
   //  myMovie = [[AVPlayerItem alloc]initWithURL:[NSURL URLWithString:@"http://hot.vrs.sohu.com/ipad1756479_4500826801582_4967790.m3u8?plat=1"]];
    myMovie = [[AVPlayerItem alloc]initWithURL:[NSURL fileURLWithPath:_videoPath]];
    
    myPlayer=[AVPlayer playerWithPlayerItem:myMovie];
    AVPlayerLayer *layer=(AVPlayerLayer *)self.myPlayView.layer;
    [layer setPlayer:myPlayer];
     [myPlayer play];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
