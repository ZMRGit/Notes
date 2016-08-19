//
//  Test1.h
//  CoreData
//
//  Created by chenguangjiang on 14-9-22.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Test1 : NSManagedObject

@property (nonatomic, retain) NSString * age;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSManagedObject *info;

@end
