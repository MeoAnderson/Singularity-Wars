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

#import "Credits.h"
#import "Menu.h"

@implementation Credits

+ (Credits *)scene
{
	return [[self alloc] init];
}

// -----------------------------------------------------------------------

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
    // Get the size of the window
	CGSize winSize = [CCDirector sharedDirector].viewSize;
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    // Background
    
    // Sprite with background, and its position (at the center of the screen)
    CCSprite* background = [CCSprite spriteWithImageNamed:@"background3.png"];
    [self addChild:background];
    

    //-----------------------------------------------------------------------------------------------------------------------------------
    // Background Particles
    
    CCParticleSystem *particlesSingularity = [CCParticleSystem particleWithFile:@"BlackHole-SingularityWars.plist"];
    particlesSingularity.position = ccp(winSize.width/2,winSize.height/2);
    [self addChild:particlesSingularity];
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    // Labels
    
    // "Credits" title, with its attributes
    
    CCLabelTTF* creditsTitle = [CCLabelTTF labelWithString:@"Credits" fontName:@"technoid" fontSize:80];
	creditsTitle.outlineColor = [CCColor grayColor];
	creditsTitle.outlineWidth = 0.7;
	creditsTitle.shadowColor = [CCColor grayColor];
	creditsTitle.shadowOffset = ccp(1,1);
    creditsTitle.position = ccp(winSize.width/2,winSize.height-100);
    [self addChild:creditsTitle];

    
    // "A game developed for" label
    
    CCLabelTTF* labelDeveloped = [CCLabelTTF labelWithString:@"A game developed for" fontName:@"technoid" fontSize:40];
	labelDeveloped.outlineColor = [CCColor grayColor];
	labelDeveloped.outlineWidth = 0.5;
	labelDeveloped.shadowColor = [CCColor grayColor];
	labelDeveloped.shadowOffset = ccp(1,1);
    labelDeveloped.position = ccp(winSize.width/2,winSize.height-150);
    [self addChild:labelDeveloped];
    
    
    // "Mobile Applications Development" label
    
    CCLabelTTF* labelDaam = [CCLabelTTF labelWithString:@"Mobile Applications Development" fontName:@"technoid" fontSize:40];
	labelDaam.outlineColor = [CCColor grayColor];
	labelDaam.outlineWidth = 0.5;
	labelDaam.shadowColor = [CCColor grayColor];
	labelDaam.shadowOffset = ccp(1,1);
    labelDaam.position = ccp(winSize.width/2,winSize.height-190);
    [self addChild:labelDaam];
    
    
    // "Special Thanks" label
    
    CCLabelTTF* labelSpecialThanks = [CCLabelTTF labelWithString:@"Special Thanks" fontName:@"technoid" fontSize:40];
	labelSpecialThanks.outlineColor = [CCColor grayColor];
	labelSpecialThanks.outlineWidth = 0.5;
	labelSpecialThanks.shadowColor = [CCColor grayColor];
	labelSpecialThanks.shadowOffset = ccp(1,1);
    labelSpecialThanks.position = ccp(winSize.width/2,winSize.height-270);
    [self addChild:labelSpecialThanks];
    
    
    //"Professor Carlos Serrão" label
    
    CCLabelTTF* labelProfCarlosSerrao = [CCLabelTTF labelWithString:@"Prof. Carlos Serrao" fontName:@"technoid" fontSize:40];
	labelProfCarlosSerrao.outlineColor = [CCColor grayColor];
	labelProfCarlosSerrao.outlineWidth = 0.5;
	labelProfCarlosSerrao.shadowColor = [CCColor grayColor];
	labelProfCarlosSerrao.shadowOffset = ccp(1,1);
    labelProfCarlosSerrao.position = ccp(winSize.width/2,winSize.height-350);
    [self addChild:labelProfCarlosSerrao];
    
    
    // "All the Cocos2D developers" label
    
    CCLabelTTF* labelCocos2dDevelopers = [CCLabelTTF labelWithString:@"All the Cocos2D developers" fontName:@"technoid" fontSize:40];
	labelCocos2dDevelopers.outlineColor = [CCColor grayColor];
	labelCocos2dDevelopers.outlineWidth = 0.5;
	labelCocos2dDevelopers.shadowColor = [CCColor grayColor];
	labelCocos2dDevelopers.shadowOffset = ccp(1,1);
    labelCocos2dDevelopers.position = ccp(winSize.width/2,winSize.height-400);
    [self addChild:labelCocos2dDevelopers];

    
    // "and Community" label
    
    CCLabelTTF* labelCocos2dCommunity = [CCLabelTTF labelWithString:@"and Community" fontName:@"technoid" fontSize:40];
	labelCocos2dCommunity.outlineColor = [CCColor grayColor];
	labelCocos2dCommunity.outlineWidth = 0.5;
	labelCocos2dCommunity.shadowColor = [CCColor grayColor];
	labelCocos2dCommunity.shadowOffset = ccp(1,1);
    labelCocos2dCommunity.position = ccp(winSize.width/2,winSize.height-470);
    [self addChild:labelCocos2dCommunity];

    

    //-----------------------------------------------------------------------------------------------------------------------------------
    
    //Buttons
    
    // "Back to Main Menu" scene button
    CCButton *backToMenuButton = [CCButton buttonWithTitle:@"Back to Main Menu" fontName:@"technoid" fontSize:45];
    backToMenuButton.positionType = CCPositionTypeNormalized;
    backToMenuButton.position = ccp(0.5f, 0.2f);
    [backToMenuButton setTarget:self selector:@selector(onBackToMenuClicked:)];
    [self addChild:backToMenuButton];
    
    // done
	return self;
}

// -----------------------------------------------------------------------
#pragma mark - Button Callbacks
// -----------------------------------------------------------------------

- (void)onBackToMenuClicked:(id)sender
{
    // Back to Main Menu, with a crossfade transition (NOT WORKING CORRECTLY, MOST LIKELY A COCOS2D BUG)
    
    [[CCDirector sharedDirector] popSceneWithTransition:[CCTransition transitionCrossFadeWithDuration:0.1]];
    //[[CCDirector sharedDirector] pushScene:[Menu scene] withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:0.2f]];
    
    [[OALSimpleAudio sharedInstance] playEffect:@"otherButton2_sfx.mp3"];
}

// -----------------------------------------------------------------------

@end
