//
//  FlightsDetailModel.m
//  HHY
//
//  Created by jiangjun on 14-6-8.
//  Copyright (c) 2014年 yunluosoft. All rights reserved.
//

#import "FlightsDetailModel.h"

@implementation FlightsDetailModel
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
