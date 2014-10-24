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

#import "HowToPlay.h"
#import "Menu.h"

@implementation HowToPlay

+ (HowToPlay *)scene
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
    
    // Sprite with background
    
    CCSprite* background = [CCSprite spriteWithImageNamed:@"background3.png"];
    [self addChild:background];
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    
    // Background Particles
    
    CCParticleSystem *particlesSingularity = [CCParticleSystem particleWithFile:@"BlackHole-SingularityWars.plist"];
    particlesSingularity.position = ccp(winSize.width/2,winSize.height/2);
    [self addChild:particlesSingularity];

    
    //-----------------------------------------------------------------------------------------------------------------------------------
    
    // Labels with instructions
    
    
    CCLabelTTF* howToPlayTitle = [CCLabelTTF labelWithString:@"How to Play" fontName:@"technoid" fontSize:80];
    howToPlayTitle.position = ccp(winSize.width/2,winSize.height-100);
	howToPlayTitle.outlineColor = [CCColor grayColor];
	howToPlayTitle.outlineWidth = 0.7;
	howToPlayTitle.shadowColor = [CCColor grayColor];
	howToPlayTitle.shadowOffset = ccp(1,1);
    [self addChild:howToPlayTitle];

    
    CCLabelTTF* InstructionsHowToControl = [CCLabelTTF labelWithString:@"To control your ship," fontName:@"technoid" fontSize:30];
	InstructionsHowToControl.outlineColor = [CCColor grayColor];
	InstructionsHowToControl.outlineWidth = 0.5;
	InstructionsHowToControl.shadowColor = [CCColor grayColor];
	InstructionsHowToControl.shadowOffset = ccp(1,1);
    InstructionsHowToControl.position = ccp(winSize.width/2,winSize.height-200);
    [self addChild:InstructionsHowToControl];
    
    CCLabelTTF* InstructionsHowToControl2 = [CCLabelTTF labelWithString:@"press and move the left joystiq." fontName:@"technoid" fontSize:30];
	InstructionsHowToControl2.outlineColor = [CCColor grayColor];
	InstructionsHowToControl2.outlineWidth = 0.5;
	InstructionsHowToControl2.shadowColor = [CCColor grayColor];
	InstructionsHowToControl2.shadowOffset = ccp(1,1);
    InstructionsHowToControl2.position = ccp(winSize.width/2,winSize.height-250);
    [self addChild:InstructionsHowToControl2];

    CCLabelTTF* InstructionsHowToShoot = [CCLabelTTF labelWithString:@"To shoot at the bad guys" fontName:@"technoid" fontSize:30];
	InstructionsHowToShoot.outlineColor = [CCColor grayColor];
	InstructionsHowToShoot.outlineWidth = 0.5;
	InstructionsHowToShoot.shadowColor = [CCColor grayColor];
	InstructionsHowToShoot.shadowOffset = ccp(1,1);
    InstructionsHowToShoot.position = ccp(winSize.width/2,winSize.height-400);
    [self addChild:InstructionsHowToShoot];
    
    CCLabelTTF* InstructionsHowToShoot2 = [CCLabelTTF labelWithString:@"press and drag the right joystiq!" fontName:@"technoid" fontSize:30];
	InstructionsHowToShoot2.outlineColor = [CCColor grayColor];
	InstructionsHowToShoot2.outlineWidth = 0.5;
	InstructionsHowToShoot2.shadowColor = [CCColor grayColor];
	InstructionsHowToShoot2.shadowOffset = ccp(1,1);
    InstructionsHowToShoot2.position = ccp(winSize.width/2,winSize.height-450);
    [self addChild:InstructionsHowToShoot2];


    
    //-----------------------------------------------------------------------------------------------------------------------------------
    
    // "Back to Main Menu" button
    
    CCButton *backMainMenuButton = [CCButton buttonWithTitle:@"Back to Main Menu" fontName:@"technoid" fontSize:45];
    backMainMenuButton.position = ccp(winSize.width/2,winSize.height/5);
    [backMainMenuButton setTarget:self selector:@selector(onBackMainMenuClicked:)];
    [self addChild:backMainMenuButton];
    
    // done
	return self;
}


- (void)onBackMainMenuClicked:(id)sender
{
    // Back to Main Menu
    
    [[CCDirector sharedDirector] popSceneWithTransition:[CCTransition transitionCrossFadeWithDuration:0.1]];
    [[OALSimpleAudio sharedInstance] playEffect:@"otherButton2_sfx.mp3"];
}

@end
