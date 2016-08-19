//
//  CustomButton.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-6.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "CustomButton.h"
#import "ThemeManger.h"
@implementation CustomButton

- (id)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNofivation object:nil];
    }
    return self;
}
-(void)themeNotification:(NSNotification *)obj
{
    [self loadImage];
}

-(id)initWithImage:(NSString *)imageName highlighteg:(NSString *)highligtImagName
{
    self = [self init];
    if(self)
    {
        self.imageName = imageName;
        self.highligtImagName = highligtImagName;
        
    }
    
    return self;
}

-(id)initWithBackBround:(NSString *)backgroundImagename highlightBackGround:(NSString *)backgroundHighligtImageName
{
    self = [self init];
    if(self)
    {
        self.backgroundImagename = backgroundImagename;
        self.backgroundHighligtImageName = backgroundHighligtImageName;
    }
        return self;
}

-(void)setImageName:(NSString *)imageName
{
    if(_imageName != imageName)
    {
        _imageName = [imageName copy];
    }
    [self loadImage];
 
    
}
-(void)setHighligtImagName:(NSString *)highligtImagName
{
    if(_highligtImagName != highligtImagName)
    {
        _highligtImagName = [highligtImagName copy];
    }
    [self loadImage];
}
-(void)setBackgroundImagename:(NSString *)backgroundImagename
{
    if(_backgroundImagename != backgroundImagename)
    {
        _backgroundImagename = [backgroundImagename copy];
    }
    [self loadImage];
}
-(void)setBackgroundHighligtImageName:(NSString *)backgroundHighligtImageName
{
  if(_backgroundHighligtImageName != backgroundHighligtImageName)
  {
      _backgroundHighligtImageName = [backgroundHighligtImageName copy];
  }
 [self loadImage];
}

-(void)loadImage
{
    ThemeManger *themeManger = [ThemeManger shareInstance];
    UIImage *image = [themeManger getThemeImage:_imageName];

    UIImage *highlightImage = [themeManger getThemeImage:_highligtImagName];
  
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:highlightImage forState:UIControlStateHighlighted];
    
    UIImage *backiImage = [themeManger getThemeImage:_imageName];
    UIImage *backHighlightImage = [themeManger getThemeImage:_highligtImagName];
    
    [self setBackgroundImage:backiImage forState:UIControlStateNormal];
    [self setBackgroundImage:backHighlightImage forState:UIControlStateHighlighted];
    
}
@end
