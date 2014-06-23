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
#import <UIKit/UIPinchGestureRecognizer.h>
#import "Menu.h"
#import "Options.h"
#import "Pause.h"
#import "GameOver.h"
#import "SneakyJoystick.h"
#import "SneakyJoystickSkinnedBase.h"
#import "SneakyInput_0_4_0AppDelegate.h"
#import "SneakyJoystickSkinnedJoystickExample.h"
#import "SneakyButtonSkinnedBase.h"
#import "SneakyButton.h"





@interface Game : CCScene

{
    
    
    // Ship
    CCSprite* Ship;
    
    
    //Joysticks
    SneakyJoystick* leftJoystick;
    
    SneakyJoystick* rightJoystick;
    
    // Laser
   CCSprite* laser;
    
    // Ghost enemy
    CCSprite* ghost;
    
    // Collision
    BOOL isCollision;
    
    // Ship lifes
    int lifes;
    CCLabelTTF* lifesLbl;

    
    // Game Over
    bool GameOver;

}

+ (Game *)scene;
- (id)init;

@property (retain,nonatomic) CCSprite* ghost;

@end