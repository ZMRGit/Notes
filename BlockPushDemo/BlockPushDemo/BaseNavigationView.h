//
//  BaseNavigationView.h
//  CustomRreshView
//
//  Created by 方廷超 on 14-10-3.
//  Copyright (c) 2014年 方廷超. All rights reserved.
#import <UIKit/UIKit.h>

@class BaseNavigationView;
typedef void(^NavigationBarClickCallBack)(NSInteger index,BaseNavigationView * navibaseView) ;
typedef void(^LeftNavigationBarClickCallBack)(BaseNavigationView * navibaseView) ;
typedef void(^RightNavigationBarClickCallBack)(BaseNavigationView * navibaseView) ;

@interface BaseNavigationView : UIView

@property (nonatomic ,weak)UIButton *leftButton;
@property (nonatomic ,weak)UIButton *titleButton;
@property (nonatomic ,weak)UIButton *rightButton;
@property (nonatomic ,weak)UIView   *statusView;

@property (nonatomic ,strong) NSString *titleName;
@property (nonatomic ,strong) UIFont  *titleFont;
@property (nonatomic ,strong) UIColor *titleColor;


@property (nonatomic ,assign)CGFloat buttonWidth;
@property (nonatomic ,assign)CGFloat leftMargin;
@property (nonatomic ,assign)CGFloat rightMargin;

@property (nonatomic ,copy)NavigationBarClickCallBack navigationClickCallBack;
@property (nonatomic ,copy)LeftNavigationBarClickCallBack leftnavigationClickCallBack;
@property (nonatomic ,copy)RightNavigationBarClickCallBack rightNavigationClickCallBack;



- (void)setLeftNomalImage:(NSString *)leftNomalImage;
- (void)setTitleNomalImage:(NSString *)titleNomalImage;
- (void)setRightNomalImage:(NSString *)rightNomalImage;

- (void)setLeftNomalImage:(NSString *)leftNomalImage selectedImage:(NSString *)hightlightedImage;
- (void)setTitleNomalImage:(NSString *)titleNomalImage selectedImage:(NSString *)hightlightedImage;
- (void)setRightNomalImage:(NSString *)rightNomalImage selectedImage:(NSString *)hightlightedImage;


@end
