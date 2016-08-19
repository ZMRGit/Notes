//
//  AVPlayerViewController.h
//  Pingdan
//
//  Created by chenguangjiang on 14-5-8.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPlayView.h"
@interface AVPlayerViewController : UIViewController

@property (weak, nonatomic) IBOutlet MyPlayView *myPlayView;
@property(strong,nonatomic)NSString *videoPath;
@end
