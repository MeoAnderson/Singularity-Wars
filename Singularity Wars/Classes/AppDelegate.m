//
//  Game.m
//  Singularity Wars
//
//  Created by Vasco Patrício on 07/03/14.
//  Copyright (c) 2014 Vasco Patrício. All rights reserved.
//
//
//"Singularity Wars" developed for Mobile Applications Development
//
// -----------------------------------------------------------------------

#import "AppDelegate.h"
#import "Menu.h"

@implementation AppDelegate

// 
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Local Notifications here so they appear after the application has been closed
    
    UILocalNotification* notifications = [[UILocalNotification alloc]init];
    
    notifications.alertAction = @"Singularity Wars";
    notifications.alertBody = @"Feeling stressed? Come shoot some bad guys!";
    notifications.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    [application setScheduledLocalNotifications:[NSArray arrayWithObject:notifications]];
    
    
    
	// This is the only app delegate method you need to implement when inheriting from CCAppDelegate.
	// This method is a good place to add one time setup code that only runs when your app is first launched.
	
	// Setup Cocos2D with reasonable defaults for everything.
	// There are a number of simple options you can change.
	// If you want more flexibility, you can configure Cocos2D yourself instead of calling setupCocos2dWithOptions:.
	[self setupCocos2dWithOptions:@{
		// Show the FPS and draw call label.
		CCSetupShowDebugStats: @(NO),
		
		// More examples of options you might want to fiddle with:
		// (See CCAppDelegate.h for more information)
		
		// Use a 16 bit color buffer: 
//		CCSetupPixelFormat: kEAGLColorFormatRGB565,
		// Use a simplified coordinate system that is shared across devices.
//		CCSetupScreenMode: CCScreenModeFixed,
		// Run in portrait mode.
        CCSetupScreenOrientation: CCScreenOrientationLandscape,
		// Run at a reduced framerate.
//		CCSetupAnimationInterval: @(1.0/30.0),
		// Run the fixed timestep extra fast.
        CCSetupFixedUpdateInterval: @(1.0/180.0),
		// Make iPad's act like they run at a 2x content scale. (iPad retina 4x)
		//CCSetupTabletScale2X: @(YES),
        //CCSetupMultiSampling: @(YES),
        //CCSetupNumberOfSamples: @(4)
	}];
	
	return YES;
}

-(CCScene *)startScene
{
	// This method should return the very first scene to be run when your app starts.
	return [Menu scene];
}

@end
