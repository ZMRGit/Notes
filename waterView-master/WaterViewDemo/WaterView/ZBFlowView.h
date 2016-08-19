//
//  ZBFlowView.h
//  DMTDevice
//
//  Created by chenguangjiang on 14-10-14.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZBFlowView;

@protocol ZBFlowViewDelegate <NSObject>

- (void)pressedAtFlowView:(ZBFlowView *)flowView;

@end

@interface ZBFlowView : UIView

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, retain) NSString *reuseIdentifier;
@property (nonatomic, assign) id <ZBFlowViewDelegate> flowViewDelegate;

@end

