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

#import "Menu.h"
#import "Options.h"
#import "Credits.h"
#import "Game.h"
#import "HowToPlay.h"
#import <UIKit/UIKit.h>


@implementation Menu

+ (Menu *)scene
{

    return [[self alloc] init];
}


- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
	
	// Get the size of the window
	CGSize winSize = [CCDirector sharedDirector].viewSize;
    
    // Enable touch handling on scene node
    self.userInteractionEnabled = YES;
    
	
	//-----------------------------------------------------------------------------------------------------------------------------------
    // Music
    [[OALSimpleAudio sharedInstance] playBg:@"wipeoutfury.mp3" loop:YES];
	
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    // Background, with its attributes
    CCSprite* background = [CCSprite spriteWithImageNamed:@"background3.png"];
    
    background.position = ccp(winSize.width/2,winSize.height/2);
	background.scale = 0.9;
    
    id backgroundRotate = [CCActionRotateBy actionWithDuration:60 angle:360];
    id repeatBackgroundRotate = [CCActionRepeatForever actionWithAction:backgroundRotate];
    
    [background runAction:repeatBackgroundRotate];
    
    [self addChild:background];
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    // Grid sprite and its rotation
	
    CCSprite* grid = [CCSprite spriteWithImageNamed:@"grid.png"];
    grid.position = ccp(winSize.width/2,winSize.height/2);
	grid.scale = 0.8;
	grid.opacity = 0.5;
    
    id gridRotate = [CCActionRotateBy actionWithDuration:20 angle:360];
	id repeatAction = [CCActionRepeatForever actionWithAction:gridRotate];
    
    [grid runAction:repeatAction];

    [self addChild:grid];
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    // Background Particles
    
    CCParticleSystem *particlesSingularity = [CCParticleSystem particleWithFile:@"BlackHole-SingularityWars.plist"];
    particlesSingularity.position = ccp(winSize.width/2,winSize.height/2);
    [self addChild:particlesSingularity];
    
    
	//-----------------------------------------------------------------------------------------------------------------------------------
	// Title text
	
    // "Singularity Wars" title, with its attributes
    CCLabelTTF* title = [CCLabelTTF labelWithString:@"Singularity Wars" fontName:@"technoid.ttf" fontSize:80];
	
	title.outlineColor = [CCColor grayColor];
	title.outlineWidth = 0.7;
	title.shadowColor = [CCColor grayColor];
	title.shadowOffset = ccp(1,1);
    title.position = ccp(winSize.width/2,winSize.height-100);
    [self addChild:title];
	
    // Animation for the Title text
    
	id titleFadeOut = [CCActionFadeOut actionWithDuration:2];
    id titleFadeIn = [CCActionFadeIn actionWithDuration:2];
	id actionTitle = [CCActionSequence actionOne:titleFadeOut two:titleFadeIn];
	id repeatActionTitle = [CCActionRepeatForever actionWithAction:actionTitle];
    
	[title runAction:repeatActionTitle];
	
    
	//-----------------------------------------------------------------------------------------------------------------------------------
	// Buttons
	
    
    // "How to play" button
    CCButton* howToPlayButton = [CCButton buttonWithTitle:@"How to Play" fontName:@"technoid" fontSize:45];
    howToPlayButton.position = ccp(winSize.width/2,winSize.height-300);
    [howToPlayButton setTarget:self selector:@selector(onHowToPlayClicked:)];
    [self addChild:howToPlayButton];

    
    // "Start" button
    CCButton* startButton = [CCButton buttonWithTitle:@"Start" fontName:@"technoid" fontSize:45];
    startButton.position = ccp(winSize.width/2,winSize.height-400);
    [startButton setTarget:self selector:@selector(onStartClicked:)];
    [self addChild:startButton];
	
	/*
	// "Options" button
	CCButton* optionsButton = [CCButton buttonWithTitle:@"Options" fontName:@"technoid" fontSize:45];
    optionsButton.position = ccp(winSize.width/2,winSize.height-500);
    [optionsButton setTarget:self selector:@selector(onOptionsClicked:)];
    [self addChild:optionsButton];
	*/	
	
	// "Credits" button
	CCButton* creditsButton = [CCButton buttonWithTitle:@"Credits" fontName:@"technoid" fontSize:45];
    creditsButton.position = ccp(winSize.width/2,winSize.height-500);
    [creditsButton setTarget:self selector:@selector(onCreditsClicked:)];
    [self addChild:creditsButton];


    // done
	return self;
}

// -----------------------------------------------------------------------

- (void)dealloc
{
    // clean up code goes here
}

// -----------------------------------------------------------------------
#pragma mark - Enter & Exit
// -----------------------------------------------------------------------

- (void)onEnter
{
    // always call super onEnter first
    [super onEnter];
    
    // In pre-v3, touch enable and scheduleUpdate was called here
    // In v3, touch is enabled by setting userInterActionEnabled for the individual nodes
    // Per frame update is automatically enabled, if update is overridden
    
}

// -----------------------------------------------------------------------

- (void)onExit
{
    // always call super onExit last
    [super onExit];
}

// Code for outputting touch positions (commented for now)
/*
-(void) touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLoc = [touch locationInNode:self];
    
    // Log touch location
    CCLOG(@"Move sprite to @ %@",NSStringFromCGPoint(touchLoc));
    
    // Move our sprite to touch location
    CCActionMoveTo *actionMove = [CCActionMoveTo actionWithDuration:1.0f position:touchLoc];
    [_sprite runAction:actionMove];
}
*/

// Functions to change scenes, with a transition

- (void)onHowToPlayClicked:(id)sender
{
    // back to intro scene with transition
    [[CCDirector sharedDirector] pushScene:[HowToPlay scene]];
	[[OALSimpleAudio sharedInstance] playEffect:@"otherButton2_sfx.mp3"];
}


- (void)onStartClicked:(id)sender
{
    // back to intro scene with transition
    [[CCDirector sharedDirector] replaceScene:[Game scene] withTransition:[CCTransition transitionFadeWithDuration:0.5]];
	[[OALSimpleAudio sharedInstance] playEffect:@"startButton_sfx.mp3"];
}

/*
- (void)onOptionsClicked:(id)sender
{
    // Go to Options Menu
    [[CCDirector sharedDirector] pushScene:[Options scene]];
	[[OALSimpleAudio sharedInstance] playEffect:@"otherButton2_sfx.mp3"];
}
*/
- (void)onCreditsClicked:(id)sender
{
    // Go to Credits Menu
    [[CCDirector sharedDirector] pushScene:[Credits scene]];
	[[OALSimpleAudio sharedInstance] playEffect:@"otherButton2_sfx.mp3"];
}
/*
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint origin = [swg.rippledSprite convertTouchToNodeSpace:touch];
    [swg createWaveAt:CGPointMake(origin.x,origin.y)];
}
*/
@end
