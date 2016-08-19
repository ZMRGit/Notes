//
//  DataBase.h
//  Sqlite
//
//  Created by chenguangjiang on 14-8-26.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//


/*
 1.创建表
 create table if not exists UserTable (username text primary key,password text,email text);
 2.插入数据
 insert or replace into UserTable (username,password,email) values(?,?,?);
 
 3.更新数据
 updata Usertable set password = '123456' where username = 'wyjl';
 
 4.查询数据
 select username ,password ,email from Usertable where username = 'wyjl';
 
 5.删除数据
 delete from Usertable where username = ''wyjl;
 
 */






#import <Foundation/Foundation.h>

@interface DataBase : NSObject
//创建表
-(void)createTable:(NSString *)sql;
/*
 *插入、删除、修改数据
 *sql: SQL语句
 *parms:修改数据位置
 *
*/
-(BOOL)dealData:(NSString *)sql paramsarray:(NSArray *)params;

/*
 *查询
 *返回值:[
            ["字段1","字段2","字段3"];
            ["字段1","字段2","字段3"];
            ["字段1","字段2","字段3"];
 
         ]
 
*/
-(NSMutableArray *)selectData:(NSString *)sql columns:(NSInteger)column;
@end
