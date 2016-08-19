//
//  ViewController.m
//  SqliteDemo
//
//  Created by chenguangjiang on 14-5-9.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ViewController.h"
#import "FMDatabase.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initFMD];
}
-(void)initFMD
{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [arr objectAtIndex:0];
    
    path =[path stringByAppendingPathComponent:@"Test.db"];
    NSLog(@"path is %@........",path);
    
    FMDatabase *database = [FMDatabase databaseWithPath:path];
    if(![database open])
    {
        NSLog(@"can not open database");
        return;
    }
    
    [database executeUpdate:@"CREATE TABLE if not exists User (serial integer  PRIMARY KEY AUTOINCREMENT,Name text,Age integer)"];
    
    NSString *path1 = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"png"];
    NSData *imgData = [NSData dataWithContentsOfFile:path1];
    
    [database executeUpdate:@"CREATE TABLE if not exists photo (serial integer  PRIMARY KEY AUTOINCREMENT,myImage BLOB)"];
   [database executeUpdate:@"INSERT INTO photo (serial,myImage) VALUES (?,?)",[NSNumber numberWithInt:1],imgData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
