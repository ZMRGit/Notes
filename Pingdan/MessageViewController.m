//
//  MessageViewController.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-5.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "MessageViewController.h"
#import "FMDatabase.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

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
    
    NSArray *arr = @[@"保存",@"查询",@"条件查询",@"更新",@"删除"];
	for(int i = 0;i< 5;i++)
    {
        UIButton *but = [UIButton  buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(50, 50+i*50, 100, 30);
        [but setTitle:[arr objectAtIndex:i]  forState:UIControlStateNormal];
        [but addTarget:self action:@selector(sqlite:) forControlEvents:UIControlEventTouchUpInside];
        but.tag = 100 + i;
        but.backgroundColor = [UIColor blueColor];
        [self.view addSubview:but];
    }
}
-(void)sqlite:(UIButton *)but
{
    if(but.tag == 100)
    {
        NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [pathArr objectAtIndex:0];
        NSString *dbPath = [docPath stringByAppendingPathComponent:@"user.db"];
        FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
        if(![database open])
        {
            NSLog(@"打开失败");
            return;
        }
        //创建表
         BOOL isresult =  [database executeUpdate:@"create table User (name text,gender text,age integer)"];
        if(isresult)
        {
            NSLog(@"创建表成功");
        }
        
      
            // 向数据库某一张表中 插入数据
            // 在数据库中插入整形数  一定要使用NSNumber类型
            [database executeUpdate:@"insert into User values (?,?,?)",@"dengchenglin",@"xiaoming",[NSNumber numberWithInt:2]];

        [database close];
        
    }
    if(but.tag == 101)
    {
        NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docPath = [pathArr objectAtIndex:0];
        NSString *dbPath = [docPath stringByAppendingPathComponent:@"user.db"];
        FMDatabase *database = [FMDatabase databaseWithPath:dbPath];
        if(![database open])
        {
            NSLog(@"打开失败");
            return;
        }
      
        //条件查询
        FMResultSet *resultSet =  [database executeQuery:@"select *from User where age = ?",[NSNumber numberWithInt:2]];
        
        //更新／修改  BOOL update = [database executeUpdate:@"update user set name = ? where age = ?",@"RyanTang",[NSNumber numberWithInt:24]];
        //删除操作
        // BOOL delete = [database executeUpdate:@"delete from user where name = ?",@"Tang"];
        while ([resultSet next]) {
            NSString *name = [resultSet stringForColumn:@"name"];
            NSString *gender = [resultSet stringForColumn:@"gender"];
            NSInteger age = [resultSet intForColumn:@"age"];
            NSLog(@"%@,%@,%d",name,gender,age);
        }
        [database close];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
