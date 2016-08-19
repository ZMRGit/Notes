//
//  PassengerDetailModel.m
//  HHY
//
//  Created by jiangjun on 14-6-8.
//  Copyright (c) 2014年 yunluosoft. All rights reserved.
//

#import "PassengerDetailModel.h"

@implementation PassengerDetailModel
-(instancetype)init
{
    if(self = [super init])
    {
        _isClick = YES;
    }
    return self;
}
-(void)setStateValue:(BOOL)state
{
    _isClick = state;
}
-(BOOL)getStateValue
{
    return _isClick;
}
@end
