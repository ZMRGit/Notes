//
//  RootViewController.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-4.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "MessageViewController.h"
#import "ProliteViewController.h"
#import "DistoreViewController.h"
#import "MoreViewController.h"
#import "BaseNavitionViewController.h"
#import "CustomButton.h"
#import "ThemeManger.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _initViewController];
  
}
-(void)_initViewController
{
    self.tabBar.hidden = YES;
    
    FirstViewController *ctl1 = [[FirstViewController alloc]init];
    MessageViewController *ctl2 = [[MessageViewController alloc]init];
    ProliteViewController *ctl3 = [[ProliteViewController alloc]init];
    DistoreViewController *ctl4 = [[DistoreViewController alloc]init];
    MoreViewController *ctl5  = [[MoreViewController alloc]init];
    NSArray *views = @[ctl1,ctl2,ctl3,ctl4,ctl5];
    NSMutableArray *viewcontrollers = [[NSMutableArray alloc]init];
    for(UIViewController *viewcontroller in views)
    {
        BaseNavitionViewController *nav  = [[BaseNavitionViewController alloc]initWithRootViewController:viewcontroller];
        [viewcontrollers addObject:nav];
    }
    
    self.viewControllers = viewcontrollers;
    
    
    UIView *butView = [[UIView alloc]initWithFrame:CGRectMake(0,440, 320, 40)];
    butView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:butView];
    

    for(int i = 1 ;i < 6;i++)
    {
        UIButton *but = [[CustomButton alloc]initWithImage:[NSString stringWithFormat:@"blue%d.jpg",i] highlighteg:[NSString stringWithFormat:@"blue%d.jpg",i]];
        but.frame = CGRectMake(50 * (i - 1), 0, 50, 40);
        [but addTarget:self action:@selector(butAct:) forControlEvents:UIControlEventTouchUpInside];
        but.tag = 100 + i;
        [butView addSubview:but];
    }
    
}
-(void)butAct:(UIButton *)but
{
    for(int i = 1;i < 6;i++)
    {
        UIButton *b = (UIButton *)[self.view viewWithTag:100 + i];
        if(b.tag == but.tag)
        {
            b.selected = YES;
        }
        else
        {
            b.selected = NO;
        }
    }
    self.selectedIndex = but.tag - 101;
    

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
