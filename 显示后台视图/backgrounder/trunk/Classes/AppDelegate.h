//
//  AppDelegate.h
//  Backgrounder
//
//  Created by lv on 10-4-13.
//  Copyright CocoaChina.com 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	
	UIWindow *window;
	UIBackgroundTaskIdentifier	bgTask;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

