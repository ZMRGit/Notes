//
//  Book.h
//  KVC_KVO
//
//  Created by chenguangjiang on 14-9-24.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
@interface Book : NSObject
{
    Author *_author;
}
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)float price;
@end
