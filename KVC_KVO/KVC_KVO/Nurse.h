//
//  Nurse.h
//  KVC_KVO
//
//  Created by chenguangjiang on 14-9-24.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Child.h"
@interface Nurse : NSObject
{
    Child *_child;
}
-(id)initWithChild:(Child *)child;

@end
