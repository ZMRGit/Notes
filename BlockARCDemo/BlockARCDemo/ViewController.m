//
//  ViewController.m
//  BlockARCDemo
//
//  Created by chenguangjiang on 14-9-28.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
@interface ViewController ()
{
    int a;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    a = 0;
	[self block1];
}
-(void)block1
{
    __block int i = 1;
    
    NSLog(@"test:%@",^{NSLog(@"%d",++i);});//直接打印 未被strong引用 在栈区
    
    
    int j = 1024;
    void (^blk)(void);
    blk = ^{
    
        printf("a = %d,i = %d j = %d",a,i,j);
        NSLog(@"由于访问了外部变量 ARC中会默认将blk创建于堆中 非ARC中则是创建于栈中");
    };
    NSLog(@"%@",blk);
    

    



    void (^blk2)(void) = ^{

        NSLog(@"jahshas");
        NSLog(@"当前block未访问任何外部变量 此时得block位于text区(二进制代码区)");
    };
    blk2();
    NSLog(@"%@",blk2);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)next {
    ViewController1 *v1 = [[ViewController1 alloc]init];
    [self.navigationController pushViewController:v1 animated:YES];
    
}
@end
