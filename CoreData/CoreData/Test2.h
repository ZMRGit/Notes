//
//  Test2.h
//  CoreData
//
//  Created by chenguangjiang on 14-9-22.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Test1;

@interface Test2 : NSManagedObject

@property (nonatomic, retain) NSString * adress;
@property (nonatomic, retain) NSString * id;
@property (nonatomic, retain) Test1 *details;

@end
