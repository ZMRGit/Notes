//
//  CustomArltView.m
//  BibleReader
//
//  Created by chenguangjiang on 15-1-26.
//  Copyright (c) 2015年 Dengchenglin. All rights reserved.
//

#import "CustomArltView.h"
static CustomArltView *customArltView;
@implementation CustomArltView
{
    NSTimer *_timer;
    UIView *_titleView;
    UILabel *_titleLabel;
    UIAlertView *_alertView;
    CompletionBlock _completionBlock;
    DidClickBlock _didClickBlock;
}
+(CustomArltView *)customArlt
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (customArltView==nil) {
            customArltView=[[CustomArltView alloc]init];
        
        }
        
    });
    return customArltView;
}
-(instancetype)init
{
    if(self =[super init])
    {
        _titleView = [[UIView alloc]init];
        [_titleView.layer setCornerRadius:10];
        _titleView.backgroundColor = kADWColor(50, 50, 50, 1);
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor whiteColor];
      
  
    }
    return self;
}
-(void)showArltTitle:(NSString *)title onView:(UIView *)view
{
    [_titleView removeFromSuperview];
    
    
    if(title && view)
    {
        _titleView.alpha = 1;
        CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:   CGSizeMake(kScreenWidth - 100, 200)];
        CGSize newSize = CGSizeMake(size.width + 40, size.height + 40);
        [_titleView setFrame:CGRectMake((view.frame.size.width - newSize.width)/2, (view.frame.size.height - newSize.height)/2, newSize.width, newSize.height)];
        [view addSubview:_titleView];
        
        [_titleLabel setFrame:CGRectMake(20, 20, size.width, size.height)];
        _titleLabel.text = title;
        _titleLabel.font = [UIFont systemFontOfSize:18];
        
        [_titleView addSubview:_titleLabel];
        
        if(_timer == nil)
        {
            _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(hiddenTitleView) userInfo:nil repeats:NO];
        }
        else
        {
            [_timer invalidate];
            _timer = nil;
            _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(hiddenTitleView) userInfo:nil repeats:NO];
        }
        
    }

}
-(void)showArltTitle:(NSString *)title onView:(UIView *)view completion:(CompletionBlock)block;
{
 
    _completionBlock = block;
    [_titleView removeFromSuperview];
   
 
    if(title && view)
    {
        _titleView.alpha = 1;
        CGSize size = [title sizeWithFont:[UIFont systemFontOfSize:18] constrainedToSize:   CGSizeMake(kScreenWidth - 100, 200)];
        CGSize newSize = CGSizeMake(size.width + 40, size.height + 40);
        [_titleView setFrame:CGRectMake((view.frame.size.width - newSize.width)/2, (view.frame.size.height - newSize.height)/2, newSize.width, newSize.height)];
        [view addSubview:_titleView];
        
       [_titleLabel setFrame:CGRectMake(20, 20, size.width, size.height)];
        _titleLabel.text = title;
        _titleLabel.font = [UIFont systemFontOfSize:18];
    
        [_titleView addSubview:_titleLabel];
        
       if(_timer == nil)
       {
             _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(hiddenTitleView) userInfo:nil repeats:NO];
       }
        else
        {
            [_timer invalidate];
            _timer = nil;
              _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(hiddenTitleView) userInfo:nil repeats:NO];
        }
        
    }
   
}


-(void)showAlertView:(UIAlertView *)alertView didClick:(DidClickBlock)block
{
    _didClickBlock = block;
    alertView.delegate = self;
    [alertView show];
}

-(void)hiddenTitleView
{
    if(_titleView)
    {
        [UIView animateWithDuration:0.5 animations:^{
        _titleView.alpha = 0;
        } completion:^(BOOL finished) {
            if(finished)
            {
                [_titleView removeFromSuperview];
            }
        }];
    }
    if(_completionBlock)
    {
        _completionBlock(YES);
    }
    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(_didClickBlock)
    {
        _didClickBlock(buttonIndex);
    }
    alertView.delegate = nil;
}


@end
