//
//  Dog.m
//  BlockDemo
//
//  Created by chenguangjiang on 14-9-26.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(id)init{
    if(self = [super init])
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updatetimer:) userInfo:nil repeats:YES];
        
    }
    return self;
}
-(void)setblock:(void (^)(Dog *, int))block
{
    [dogBlock release];
    dogBlock = [block retain];
    
}
-(void)updatetimer:(id)arg
{
    _breakCount ++;
  
    if(dogBlock)
    {
        dogBlock(self,_breakCount);
    }
    
}
- (void)dealloc
{
    [dogBlock release];
    [super dealloc];
}
@end
