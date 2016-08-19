//
//  ViewController1.m
//  积分强Demo
//
//  Created by chenguangjiang on 14-7-16.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController1.h"
#import "ADCPowerWallViewControllerDelegate.h"
#import "ADCPowerWallViewController.h"
#import "MBProgressHUD.h"
@interface ViewController1 ()<ADCPowerWallViewControllerDelegate,MBProgressHUDDelegate>

@end

@implementation ViewController1
{
        ADCPowerWallViewController *_powerWallViewController;
      MBProgressHUD *hud;
    
   
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
    
    if (_powerWallViewController == nil) {
        _powerWallViewController = [[ADCPowerWallViewController initWithSiteId:@"2594"
                                                                       siteKey:@"01c355fcccd96741f4723e9b70e39a3a"
                                                                       mediaId:@"1062"
                                                                userIdentifier:@"223549"
                                                                    useSandBox:NO
                                               powerWallViewControllerDelegate:self] retain];
    }
    
    
        [_powerWallViewController loadiOSAppList];
    
//    self.view.backgroundColor = [UIColor yellowColor];
//    hud = [[MBProgressHUD alloc]initWithFrame:CGRectMake(120, 200, 80, 80)];
//    hud.backgroundColor = [UIColor blackColor];
//    hud.delegate = self;
//
//   
//    [hud show:YES];
    
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(50, 50, 100, 100);
    but.backgroundColor =[UIColor redColor];
    [but addTarget:self action:@selector(butAct) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:but];
}
-(void)iOSAppListLoaded:(id)responseObject
{
    //[hud hide:YES];
}
-(void)butAct
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    [super dealloc];
    [hud release];
    hud = nil;
    [_powerWallViewController release];
    _powerWallViewController = nil;
    
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
