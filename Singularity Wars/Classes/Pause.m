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

#import "Pause.h"
#import "Game.h"
#import "Menu.h"

@implementation Pause

+ (Pause *)scene
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
    
    // Sprite with background
    //CCSprite* background = [CCSprite spriteWithImageNamed:@"background3.png"];
    //[self addChild:background];
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    // Background Particles
    
    CCParticleSystem *particlesSingularity = [CCParticleSystem particleWithFile:@"BlackHole-SingularityWars.plist"];
    particlesSingularity.position = ccp(winSize.width/2,winSize.height/2);
    [self addChild:particlesSingularity];
    
    
    
    // "Game Paused" title
    CCLabelTTF* gamePausedTitle = [CCLabelTTF labelWithString:@"Game Paused" fontName:@"technoid" fontSize:80];
    gamePausedTitle.position = ccp(winSize.width/2,winSize.height-100);
	gamePausedTitle.outlineColor = [CCColor grayColor];
	gamePausedTitle.outlineWidth = 0.7;
	gamePausedTitle.shadowColor = [CCColor grayColor];
	gamePausedTitle.shadowOffset = ccp(1,1);
    [self addChild:gamePausedTitle];
    
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    
    // "Resume Game" button
    CCButton *resumeButton = [CCButton buttonWithTitle:@"Resume Game" fontName:@"technoid" fontSize:45];
    resumeButton.position = ccp(winSize.width/2,winSize.height/2);
    [resumeButton setTarget:self selector:@selector(onResumeGameClicked:)];
    [self addChild:resumeButton];
    
    
    // "Back to Main Menu" button
    
    CCButton *backMainMenuButton = [CCButton buttonWithTitle:@"Back to Main Menu" fontName:@"technoid" fontSize:45];
    backMainMenuButton.position = ccp(winSize.width/2,winSize.height/3);
    [backMainMenuButton setTarget:self selector:@selector(onBackMainMenuClicked:)];
    [self addChild:backMainMenuButton];
    
    
    // done
	return self;
}


- (void)onResumeGameClicked:(id)sender
{
    // Resume the game
    [[CCDirector sharedDirector] popSceneWithTransition:[CCTransition transitionCrossFadeWithDuration:0.4]];
    [[OALSimpleAudio sharedInstance] playEffect:@"otherButton2_sfx.mp3"];
}

- (void)onBackMainMenuClicked:(id)sender
{
    // Back to Main Menu
    
    [[CCDirector sharedDirector] pushScene:[Menu scene] withTransition:[CCTransition transitionFadeWithDuration:2]];
    [[OALSimpleAudio sharedInstance] playEffect:@"Button2_sfx.mp3"];
}

@end
