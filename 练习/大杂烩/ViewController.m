//
//  ViewController.m
//  大杂烩
//
//  Created by chenguangjiang on 14-9-20.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //正常调用
    Dog *dog = [[Dog alloc]init];
    NSString *dogname = [dog setDogName:3 name:@"小花"];
    
 
    NSLog(@"%@",dogname);
    
    //NSIvocation调用
    //NSInvocation可以处理参数、返回值
    SEL mySelector = @selector(setDogName:name:);
    NSMethodSignature *class = [[dog class]instanceMethodSignatureForSelector:mySelector];
    NSInvocation *myInvocation = [NSInvocation invocationWithMethodSignature:class];
    [myInvocation setTarget:dog];
    [myInvocation setSelector:mySelector];
    
    NSInteger age = 3;
    [myInvocation setArgument:&age atIndex:2];
//设置参数 第一个参数的位置为2
    NSString *name = @"小花";
    [myInvocation setArgument:&name atIndex:3];
    
    NSString *result = nil;
    [myInvocation retainArguments];
    [myInvocation invoke];
    [myInvocation getReturnValue:&result];
    NSLog(@"%@",result);
    
    
   

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)act:(id)sender {
    

}
@end
