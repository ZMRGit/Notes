//
//  ThemeManger.m
//  Pingdan
//
//  Created by chenguangjiang on 14-5-6.
//  Copyright (c) 2014年 chenguangjiang. All rights reserved.
//

#import "ThemeManger.h"
static ThemeManger *themeManger;
@implementation ThemeManger

+(ThemeManger *)shareInstance
{
    
    if(themeManger == nil)
    {
        @synchronized(self)
        {
            themeManger = [[ThemeManger alloc]init];
        }
    }
    return themeManger;
}
-(id)init
{
    self = [super init];
    
    if(self)
    {
        NSString *themePath = [[NSBundle mainBundle] pathForResource:@"ThemeManger" ofType:@"plist"];
    
        self.themesPlist = [NSDictionary dictionaryWithContentsOfFile:themePath];
        self.themeName = nil;
    }
    return self;
    
    
}
-(NSString *)getThemePath
{
    if(self.themeName == nil)
    {
        NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
        return resourcePath;
    }
    
    NSString *themePath = [self.themesPlist objectForKey:_themeName];
    NSString *resourcePath = [[NSBundle mainBundle]resourcePath];
    NSString *path = [resourcePath stringByAppendingPathComponent:themePath];
    return path;
    
}
-(UIImage *)getThemeImage:(NSString *)imageName
{
    
    if(imageName.length == 0)
    {
        return nil;
    }
    NSString *themepath = [self getThemePath];
  
    NSString *imagePath = [themepath stringByAppendingPathComponent:imageName];
   UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
  
    
    return image;
}
@end
