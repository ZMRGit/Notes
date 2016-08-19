

//
//  ViewController.m
//  KVC_KVO
//
//  Created by chenguangjiang on 14-9-23.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Author.h"
#import "Book.h"
#import "Child.h"
#import "Nurse.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //KVC通过键访问对象的属性(包括私有属性 如果有与其变量相同的方法则会优先访问方法不再访问变量)
    NSLog(@"%@",NSStringFromCGSize([UIScreen mainScreen].bounds.size));
    Person *person = [[Person alloc]init];
    [person setValue:@"dengchenglin" forKey:@"_name"];
    NSLog(@"%@",[person valueForKey:@"name"]);//访问私有变量
    NSLog(@"%@",[person valueForKey:@"privateMethod"]);//访问私有方法
    NSLog(@"%@",[person valueForKey:@"voidMethod"]);
    
    NSLog(@"%@",person);
    
    Dog *dog = [[Dog alloc]init];
    NSLog(@"%lu",(unsigned long)dog.retainCount);
    [person setValue:dog forKey:@"dog"];
     NSLog(@"%lu",(unsigned long)dog.retainCount);//通过键值来赋值会增加retainCount 如果dog生成了set方法会优先调用set方法
    
    [person setValue:@22 forKey:@"age"];
    NSLog(@"%@",[person valueForKey:@"age"]);
    
    [dog release];
    [person release];
    
    

    
    
    //KVC键值路径
    
    Book *book = [[Book alloc]init];
    Author *author = [[Author alloc]init];
    [book setValue:author forKey:@"author"];
    NSLog(@"%lu",(unsigned long)author.retainCount);
    [book setValue: @"天婵土豆"forKeyPath:@"author.name"];
    NSLog(@"%@",[book valueForKeyPath:@"author.name"]);
    
    
    //KVC的运算
    Author *author1 = [[Author alloc]init];
    [author1 setValue:@"天蚕土豆" forKey:@"name"];
    Book *book1 =  [[Book alloc]init];
    book1.name = @"大主宰";
    book1.price = 9.9;
    
    Book *book2 = [[Book alloc]init];
    book2.name = @"武动乾坤";
    book2.price = 8.8;
    NSArray *books = [[NSArray alloc]initWithObjects:book,book1,book2, nil];
    [author1 setValue:books forKey:@"books"];
    
    NSArray *priceArr = [author1 valueForKeyPath:@"books.price"];
    NSLog(@"%@",priceArr);
    NSNumber *count = [author1 valueForKeyPath:@"books.@count"];
    NSLog(@"count = %@",count);
    
    NSNumber *sum = [author1 valueForKeyPath:@"books.@sum.price"];
    NSLog(@"%@",sum);
    
    
    
    
    
    
    
    
    
    //KVO
    
    Child *child = [[Child alloc]init];
    Nurse *nurse = [[Nurse alloc]initWithChild:child];
    //[[NSRunLoop currentRunLoop]run];
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
