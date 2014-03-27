//
//  HelloWorldScene.h
//  Singularity Wars
//
//  Created by Vasco Patrício on 06/03/14.
//  Copyright Vasco Patrício 2014. All rights reserved.
//
// -----------------------------------------------------------------------

// Importing cocos2d.h and cocos2d-ui.h, will import anything you need to start using Cocos2D v3
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import <GameKit/GameKit.h>
#import <GameKit/GKLocalPlayer.h>


// -----------------------------------------------------------------------

/**
 *  The main scene
 */
@interface Menu : CCScene

// -----------------------------------------------------------------------

+ (Menu *)scene;
- (id)init;

// -----------------------------------------------------------------------
@end