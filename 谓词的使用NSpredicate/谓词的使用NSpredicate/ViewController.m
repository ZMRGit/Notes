//
//  ViewController.m
//  谓词的使用NSpredicate
//
//  Created by chenguangjiang on 14-9-24.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //谓词NSPredicate 条件语句 条件对象均为元素对象的属性
    
    NSArray *persons = [NSArray arrayWithObjects:[Person personWithName:@"mac" andAge:20], [Person personWithName:@"hate" andAge:25],[Person personWithName:@"999ere" andAge:30],[Person personWithName:@"aruse" andAge:28],[Person personWithName:@"Erse" andAge:30],[Person personWithName:@"Ahon" andAge:29],[Person personWithName:@"ate" andAge:20],[Person personWithName:@"Iog" andAge:50],nil];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age<%d",30];
      NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"name = 'ate' && age = 20"];
    
     NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"self.name in {'小黑','mac','Ahon','Iog'} || self.age in {20,28,25}"];
    //name以什么什么开头
     NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"name beginswith 'a' "];
    //name以什么结尾
     NSPredicate *predicate4 = [NSPredicate predicateWithFormat:@"name endswith 'e' "];
    //name是否包含xxx字符
       NSPredicate *predicate5 = [NSPredicate predicateWithFormat:@"name contains 'a' "];
    //like * 匹配任意多个字符
    /*
        *a  以a结尾
        *a* 只要包含了a的
        ?a* 第二个字符为a的
     */
    NSPredicate *predicate6 = [NSPredicate predicateWithFormat:@"name like '*a*' "];
    NSLog(@"%@", [persons filteredArrayUsingPredicate:predicate]
          );
    NSLog(@"%@", [persons filteredArrayUsingPredicate:predicate1]
          );
    NSLog(@"%@", [persons filteredArrayUsingPredicate:predicate2]
          );
    NSLog(@"%@", [persons filteredArrayUsingPredicate:predicate3]
          );
    NSLog(@"%@", [persons filteredArrayUsingPredicate:predicate4]
          );
    NSLog(@"%@", [persons filteredArrayUsingPredicate:predicate5]
          );
    NSLog(@"%@", [persons filteredArrayUsingPredicate:predicate6]
          );
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
