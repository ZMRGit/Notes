//
//  ViewController.h
//  ConllectionViewDemo
//
//  Created by chenguangjiang on 14-9-3.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
- (IBAction)next;
- (IBAction)download:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *startBut;
@property (weak, nonatomic) IBOutlet UIProgressView *prosView;

- (IBAction)pause:(id)sender;

- (IBAction)resume;
@end
