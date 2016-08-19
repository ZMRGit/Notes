//
//  BaseNavigationView.m
//  CustomRreshView
//
//  Created by 方廷超 on 14-10-3.
//  Copyright (c) 2014年 方廷超. All rights reserved.
//

#import "BaseNavigationView.h"
#import "CONST.h"
@interface BaseNavigationView()



@end

@implementation BaseNavigationView

#ifndef NAVIGATIONBARCOLOR
#define NAVIGATIONBARCOLOR    RGB(248, 111, 104, 1)
#endif

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = NAVIGATIONBARCOLOR;
        self.buttonWidth = 64.f;
        [self setupUi];
    }
    return self;
}

#pragma mark -创建UI
- (void) setupUi
{
    
    self.leftMargin = 10;
    self.rightMargin = 10;
    
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.tag = 1000;
    [self addSubview:_leftButton];
    
    _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleButton.tag = 1001;
    _titleButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:19];
    [self addSubview:_titleButton];
    
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.tag = 1002;
    [self addSubview:_rightButton];
    
    
    _leftButton.userInteractionEnabled = NO;
    _titleButton.userInteractionEnabled = NO;
    _rightButton.userInteractionEnabled = NO;

    [_leftButton addTarget:self action:@selector(clickNavigationButtonAtIndex:) forControlEvents:UIControlEventTouchUpInside];
    [_titleButton addTarget:self action:@selector(clickNavigationButtonAtIndex:) forControlEvents:UIControlEventTouchUpInside];
    [_rightButton addTarget:self action:@selector(clickNavigationButtonAtIndex:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setLeftNomalImage:(NSString *)leftNomalImage
{
    _leftButton.userInteractionEnabled = YES;
    [_leftButton setImage:[UIImage imageNamed:leftNomalImage] forState:UIControlStateNormal];
}

- (void)setTitleNomalImage:(NSString *)titleNomalImage
{
    _titleButton.userInteractionEnabled = YES;
    [_titleButton setImage:[UIImage imageNamed:titleNomalImage] forState:UIControlStateNormal];
}

- (void)setRightNomalImage:(NSString *)rightNomalImage
{
    _rightButton.userInteractionEnabled = YES;
    [_rightButton setImage:[UIImage imageNamed:rightNomalImage] forState:UIControlStateNormal];
}


- (void)setLeftNomalImage:(NSString *)leftNomalImage selectedImage:(NSString *)hightlightedImage
{
    _leftButton.userInteractionEnabled = YES;
    [_leftButton setImage:[UIImage imageNamed:leftNomalImage] forState:UIControlStateNormal];
    [_leftButton setImage:[UIImage imageNamed:hightlightedImage] forState:UIControlStateSelected];
}

- (void)setRightNomalImage:(NSString *)rightNomalImage selectedImage:(NSString *)hightlightedImage
{
    _rightButton.userInteractionEnabled = YES;
    [_rightButton setImage:[UIImage imageNamed:rightNomalImage] forState:UIControlStateNormal];
    [_rightButton setImage:[UIImage imageNamed:hightlightedImage] forState:UIControlStateSelected];
}

- (void)setTitleNomalImage:(NSString *)titleNomalImage selectedImage:(NSString *)hightlightedImage
{
    _titleButton.userInteractionEnabled = YES;
    [_titleButton setImage:[UIImage imageNamed:titleNomalImage] forState:UIControlStateNormal];
    [_titleButton setImage:[UIImage imageNamed:hightlightedImage] forState:UIControlStateSelected];
}

- (void)setTitleName:(NSString *)titleName
{
    _titleName = titleName;
    
    [_titleButton setTitle:titleName forState:UIControlStateNormal];
}

- (void)setTitleFont:(UIFont *)titleFont
{
    _titleFont = titleFont;
    
    _titleButton.titleLabel.font = titleFont;
}

- (void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    [_titleButton setTitleColor:titleColor forState:UIControlStateNormal];
}


- (void)clickNavigationButtonAtIndex:(UIButton *)button
{
    NSInteger tag = button.tag-1000;
    if (self.navigationClickCallBack) {
        self.navigationClickCallBack(tag,self);
    }else{
        
        if (tag == 0) {
            
            if (self.leftnavigationClickCallBack) {
                
                self.leftnavigationClickCallBack(self);
                
            }
        }
        if (tag == 2) {
            
            if (self.rightNavigationClickCallBack) {
                
                self.rightNavigationClickCallBack(self);
                
            }
        }
        
    }
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat topMargin = 15;
    _leftButton.frame = CGRectMake(0, 0, self.buttonWidth, self.bounds.size.height);
    _titleButton.frame = CGRectMake(_leftButton.bounds.size.width+_leftButton.frame.origin.x+self.leftMargin, 0, kScreenWidth-(self.buttonWidth*2+self.leftMargin+self.rightMargin), self.bounds.size.height);
    _rightButton.frame = CGRectMake(kScreenWidth-self.buttonWidth, 0, self.buttonWidth, self.bounds.size.height);
    
    _leftButton.imageEdgeInsets = UIEdgeInsetsMake(topMargin, 0, 0, 0);
    _titleButton.titleEdgeInsets = UIEdgeInsetsMake(topMargin, 0, 0, 0);
    _rightButton.imageEdgeInsets = UIEdgeInsetsMake(topMargin, 0, 0, 0);
}

- (void)dealloc
{
    self.navigationClickCallBack = nil;
    self.leftnavigationClickCallBack = nil;
    self.rightNavigationClickCallBack = nil;
    self.titleColor = nil;
    self.titleFont = nil;
    self.titleName = nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
