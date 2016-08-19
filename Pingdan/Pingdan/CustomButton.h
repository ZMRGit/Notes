//
//  CustomButton.h
//  Pingdan
//
//  Created by chenguangjiang on 14-5-6.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIButton
@property(nonatomic,copy)NSString *imageName;
@property(nonatomic,copy)NSString *highligtImagName;
@property(nonatomic,copy)NSString *backgroundImagename;
@property(nonatomic,copy)NSString *backgroundHighligtImageName;

-(id)init;
-(id)initWithImage:(NSString *)imageName highlighteg:(NSString *)highligtImagName;

-(id)initWithBackBround:(NSString *)backgroundImagename highlightBackGround:(NSString *)backgroundHighligtImageName;
@end
