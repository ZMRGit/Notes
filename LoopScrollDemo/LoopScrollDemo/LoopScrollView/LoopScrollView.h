//
//  LoopScrollView.h
//  LoopScrollDemo
//
//  Created by chenguangjiang on 15/11/10.
//  Copyright © 2015年 Dengchenglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoopScrollView : UIScrollView
@property(nonatomic,copy)NSArray *models;
@end
@interface LoopScrollModel : NSObject
@property(nonatomic,copy)NSString *imageUrl;
+(NSArray *)modelsWithDataSoures:(NSArray *)dataSoures;
@end