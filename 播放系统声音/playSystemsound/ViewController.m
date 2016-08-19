//
//  ViewController.m
//  playSystemsound
//
//  Created by ddmap on 13-2-21.
//  Copyright (c) 2013年 ddmap. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton*btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"播放" forState:UIControlStateNormal];
    btn.frame=CGRectMake(110, 300, 100, 40);
    [btn addTarget:self action:@selector(playSound) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)playSound{
    //系统声音
     AudioServicesPlaySystemSound(1007);
    
    
    //震动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
