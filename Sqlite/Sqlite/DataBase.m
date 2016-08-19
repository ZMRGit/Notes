//
//  DataBase.m
//  Sqlite
//
//  Created by chenguangjiang on 14-8-26.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "DataBase.h"
#import <sqlite3.h>
#define kFileName @"data.sqlite"

@implementation DataBase
//数据库文件路径
-(NSString *)filePath
{
    NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",kFileName];
    return filePath;
}

-(void)createTable:(NSString *)sql
{
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

-(BOOL)dealData:(NSString *)sql paramsarray:(NSArray *)params
{
      sqlite3 *sqlite = nil;
      sqlite3_stmt *stmt = nil;
    
    //打开数据库
    if(sqlite3_open([self.filePath UTF8String], &sqlite) != SQLITE_OK)
    {
        NSLog(@"打开数据库失败");
        sqlite3_close(sqlite);
        return NO;
    }
    //编译SQL语句
    if(sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL) != SQLITE_OK)
    {
        NSLog(@"SQL语句编译失败");
        sqlite3_close(sqlite);
        return NO;
    }
    
    //绑定数据
    for(int i = 0;i < params.count;i++)
    {
        NSString *value = [params objectAtIndex:i];
        sqlite3_bind_text(stmt, i+1, [value UTF8String], -1, NULL);
        if(sqlite3_step(stmt) == SQLITE_ERROR)
        {
            NSLog(@"SQL语句执行失败");
            sqlite3_close(sqlite);
            return NO;
        }
    }
    
    
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    return YES;
}

-(NSMutableArray *)selectData:(NSString *)sql columns:(NSInteger)column
{
    sqlite3 *sqlite = nil;
    sqlite3_stmt *stmt = nil;
    
    //打开数据库
    if(sqlite3_open([self.filePath UTF8String], &sqlite) != SQLITE_OK)
    {
        NSLog(@"打开数据库失败");
        sqlite3_close(sqlite);
        return NO;
    }
    //编译SQL语句
    if(sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL) != SQLITE_OK)
    {
        NSLog(@"SQL语句编译失败");
        sqlite3_close(sqlite);
        return NO;
    }
    
    int result = sqlite3_step(stmt);
    NSMutableArray *data = [NSMutableArray array];
    while (result == SQLITE_ROW) {
        NSMutableArray *row = [NSMutableArray arrayWithCapacity:3];
        for(int i = 0;i < column;i++)
        {
           char *s = (char *)sqlite3_column_text(stmt, i);
            NSString *columnStr = [NSString stringWithCString:s encoding:NSUTF8StringEncoding];
            [row addObject:columnStr];
        }
        [data addObject:row];
    }
    
    
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    return data;
}

@end
