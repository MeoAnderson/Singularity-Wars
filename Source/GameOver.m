//
//  GameOver.m
//  Singularity Wars
//
//  Created by Vasco Patrício on 23/06/14.
//  Copyright (c) 2014 Vasco Patrício. All rights reserved.
//

#import "GameOver.h"
#import "Game.h"
#import "Menu.h"

@implementation GameOver

+ (GameOver *)scene
{
	return [[self alloc] init];
}

// -----------------------------------------------------------------------

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
    self.userInteractionEnabled = YES;
    self.multipleTouchEnabled = YES;
    
    // Get the size of the window
	CGSize winSize = [CCDirector sharedDirector].viewSize;

    //-----------------------------------------------------------------------------------------------------------------------------------
    // Background Particles
    
    CCParticleSystem *particlesSingularity = [CCParticleSystem particleWithFile:@"BlackHole-SingularityWars.plist"];
    particlesSingularity.position = ccp(winSize.width/2,winSize.height/2);
    [self addChild:particlesSingularity];
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    
    // "Game Paused" title
    CCLabelTTF* gameOverTitle = [CCLabelTTF labelWithString:@"Game Over" fontName:@"technoid" fontSize:80];
    gameOverTitle.position = ccp(winSize.width/2,winSize.height-100);
	gameOverTitle.outlineColor = [CCColor grayColor];
	gameOverTitle.outlineWidth = 0.7;
	gameOverTitle.shadowColor = [CCColor grayColor];
	gameOverTitle.shadowOffset = ccp(1,1);
    [self addChild:gameOverTitle];
    
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------

    
    // "Restart Game" button
    CCButton *restartButton = [CCButton buttonWithTitle:@"Restart Game" fontName:@"technoid" fontSize:45];
    restartButton.position = ccp(winSize.width/2,winSize.height/2);
    [restartButton setTarget:self selector:@selector(onRestartGameClicked:)];
    [self addChild:restartButton];
    
    
    
    // "Back to Main Menu" button
    
    CCButton *backMainMenuButton = [CCButton buttonWithTitle:@"Back to Main Menu" fontName:@"technoid" fontSize:45];
    backMainMenuButton.position = ccp(winSize.width/2,winSize.height/3);
    [backMainMenuButton setTarget:self selector:@selector(onBackMainMenuClicked:)];
    [self addChild:backMainMenuButton];
    
    
    // done
	return self;
}

- (void)onRestartGameClicked:(id)sender
{
    // Restart the game
    [[CCDirector sharedDirector] pushScene:[Game scene] withTransition:[CCTransition transitionFadeWithDuration:0.4]];
    [[OALSimpleAudio sharedInstance] playEffect:@"Button2_sfx.mp3"];
}

- (void)onBackMainMenuClicked:(id)sender
{
    // Back to Main Menu
    
    [[CCDirector sharedDirector] pushScene:[Menu scene] withTransition:[CCTransition transitionFadeWithDuration:2]];
    [[OALSimpleAudio sharedInstance] playEffect:@"Button2_sfx.mp3"];
}

@end
