//
//  Person.m
//  BlockDemo
//
//  Created by chenguangjiang on 14-9-26.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setDog:(Dog *)dog
{
    if(_dog != dog)
    {
        [_dog release];
        _dog = [dog retain];
        
        [_dog setblock:^(Dog *dog,int b){
        
            NSLog(@"%@ %d",dog,b);
        }];
    }
}
-(Dog *)getDog
{
 
    return _dog;
}
- (void)dealloc
{
    [super dealloc];
}
@end
