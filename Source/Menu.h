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

// Importing cocos2d.h and cocos2d-ui.h, will import anything you need to start using Cocos2D v3
#import "cocos2d.h"
#import "cocos2d-ui.h"
#import <GameKit/GameKit.h>
#import <GameKit/GKLocalPlayer.h>


// -----------------------------------------------------------------------

/**
 *  The main scene
 */

@interface RipplesLayer : CCNode

@end

@interface Menu : CCScene

// -----------------------------------------------------------------------

+ (Menu *)scene;
- (id)init;

// -----------------------------------------------------------------------
@end