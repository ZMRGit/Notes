//
//  uzysRadialProgressActivityIndicator.h
//  UzysRadialProgressActivityIndicator
//
//  Created by Uzysjung on 13. 10. 22..
//  Copyright (c) 2013년 Uzysjung. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^actionHandler)(void);
typedef NS_ENUM(NSUInteger, UZYSPullToRefreshState) {
    UZYSPullToRefreshStateNone =0,
    UZYSPullToRefreshStateStopped,
    UZYSPullToRefreshStateTriggering,
    UZYSPullToRefreshStateTriggered,
    UZYSPullToRefreshStateLoading,
    
};


@interface UzysRadialProgressActivityIndicator : UIView

@property (nonatomic,assign) BOOL isObserving;
@property (nonatomic,assign) double rProgress;
@property (nonatomic, assign) CGFloat originalTopInset;

@property (nonatomic,assign) UZYSPullToRefreshState state;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) actionHandler pullToRefreshHandler;
- (id)initWithImage:(UIImage *)image;

- (void)setRProgress:(double)rProgress;

- (void)stopIndicatorAnimation;
- (void)manuallyTriggered;
@end
