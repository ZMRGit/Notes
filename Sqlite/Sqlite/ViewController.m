//
//  ViewController.m
//  Sqlite
//
//  Created by chenguangjiang on 14-8-26.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

#define kFileName @"test.sqlite"
@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	[self createTable];
    [self insertTable];
}

-(NSString *)filePath
{
    NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",kFileName];
    return filePath;
}

-(void)createTable
{
    NSString *sql = @"create table if not exists User(username text primary key, password text, email text)";
    
    sqlite3 *sqlite = nil;
    //打开数据库
    if(sqlite3_open([self.filePath UTF8String], &sqlite) != SQLITE_OK)
    {
        NSLog(@"打开数据库失败");
        return;
    }
    
    char *error;
    if(sqlite3_exec(sqlite, [sql UTF8String], NULL, NULL, &error) != SQLITE_OK)
    {
        NSLog(@"创建表失败 error = %s",error);
        
    }
    
    sqlite3_close(sqlite);
}

-(void)insertTable
{
    sqlite3 *sqlite= nil;
    sqlite3_stmt *stmt = nil;
    
    //打开数据库
    int result = sqlite3_open([self.filePath UTF8String], &sqlite);
    if(result != SQLITE_OK)
    {
        NSLog(@"打开数据库失败");
        return;
    }
    
    //创建SQL语句
    NSString *sql  = @"insert into User(username,password,email) values (?,?,?)";
    //编译SQL语句
     sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL);
    NSString *username = @"dengchenglin1";
    NSString *password = @"123456";
    NSString *email = @"297854263@qq.com";
    
    //往SQL语句上填充数据
    sqlite3_bind_text(stmt, 1, [username UTF8String], -1, NULL);
    sqlite3_bind_text(stmt, 2, [password UTF8String], -1, NULL);
    sqlite3_bind_text(stmt, 3, [email UTF8String], -1, NULL);
    
    result = sqlite3_step(stmt);
    if(result == SQLITE_ERROR||result == SQLITE_MISUSE)
    {
        NSLog(@"填充数据失败");
        return;
    }
    
    
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
