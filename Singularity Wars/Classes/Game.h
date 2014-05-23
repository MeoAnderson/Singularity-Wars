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

#import "cocos2d.h"
#import "cocos2d-ui.h"
#import "Menu.h"
#import "Options.h"
#import "Pause.h"
#import "SneakyJoystick.h"
#import "SneakyJoystickSkinnedBase.h"
#import "SneakyInput_0_4_0AppDelegate.h"
#import "SneakyJoystickSkinnedJoystickExample.h"
#import "SneakyButtonSkinnedBase.h"
#import "SneakyButton.h"


@interface Game : CCScene

{
    
    CCSprite* myShip;
    SneakyJoystickSkinnedBase* leftJoystick;
    
    SneakyJoystickSkinnedBase* rightJoystick;
    
}

+ (Game *)scene;
- (id)init;

@end