//
//  HelloWorldScene.m
//  Singularity Wars
//
//  Created by Vasco Patrício on 06/03/14.
//  Copyright Vasco Patrício 2014. All rights reserved.
//
// -----------------------------------------------------------------------

#import "Menu.h"
#import "Options.h"
#import "Credits.h"
#import "Game.h"
#import "HowToPlay.h"


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

	/*
    - (void) playerAuthentication
    {
        GKLocalPlayer* localPlayer = [GKLocalPlayer localPlayer];
        localPlayer.authenticateHandler = ^(UIViewController* viewController, NSError* error){
        
            if (viewController != nil){
            
            
                [self showAuthentication]
                
            }
        
        
    }
    */
	//-----------------------------------------------------------------------------------------------------------------------------------
    // Music
    [[OALSimpleAudio sharedInstance] playBg:@"wipeoutfury.mp3" loop:YES];
	
    
	//-----------------------------------------------------------------------------------------------------------------------------------
    // Background, with its attributes and fade-in animation
    CCSprite* background = [CCSprite spriteWithImageNamed:@"background3.png"];
    background.position = ccp(winSize.width/2,winSize.height/2);
	background.scale = 0.5;
    [self addChild:background];
	
	
    /*
    CCActionFadeIn* animatingBackground = [CCActionFadeIn actionWithDuration:2];
    animatingBackground.duration = 2;
    [background runAction:animatingBackground];
	*/
    
	//-----------------------------------------------------------------------------------------------------------------------------------
    // Particles
    CCParticleExplosion* particlesBackground = [CCParticleExplosion particleWithTotalParticles:2000];
	particlesBackground.color = [CCColor orangeColor];
    particlesBackground.speed = 150.0f;
    particlesBackground.duration = -1;
    particlesBackground.emissionRate = 700;
    particlesBackground.sourcePosition = ccp(0,0);
    [self addChild:particlesBackground];
	
	
	/*
	CCParticleGalaxy* particlesGalaxy = [CCParticleGalaxy particleWithTotalParticles:2000];
	
	particlesGalaxy.color = [CCColor orangeColor];
	particlesGalaxy.sourcePosition = ccp(0,200);
	particlesGalaxy.emissionRate = 500;
	particlesGalaxy.duration = -1;
	particlesGalaxy.life = 4.0f;
	
	[self addChild:particlesGalaxy];
	*/
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------
    // Grid sprite, fade-in animation and sine movement (for wave effect)
	
    CCSprite* grid = [CCSprite spriteWithImageNamed:@"grid.png"];
    grid.position = ccp(winSize.width/2,winSize.height/2);
	grid.scale = 0.8;
	grid.opacity = 0.5;
    [self addChild:grid];
    /*
	// Fade-in animation for the grid
    CCActionFadeIn* animatingGrid = [CCActionFadeIn actionWithDuration:2];
    [grid runAction:animatingGrid];
	*/
	// TBD - WAVE MOVEMENT FOR THE GRID - Temporary Effect in place
	
	id jump = [CCActionRotateBy actionWithDuration:20 angle:-360];
	id action = [CCActionEaseElastic actionWithAction:jump];
	id repeatAction = [CCActionRepeatForever actionWithAction:action];
	
	[grid runAction:repeatAction];
    
	//-----------------------------------------------------------------------------------------------------------------------------------
	//Title text, and its fade-in animation
	
    // "Singularity Wars" title, with its attributes
    CCLabelTTF* title = [CCLabelTTF labelWithString:@"Singularity Wars" fontName:@"technoid" fontSize:80];
	
	title.outlineColor = [CCColor grayColor];
	title.outlineWidth = 0.5;
	title.shadowColor = [CCColor grayColor];
	title.shadowOffset = ccp(1,1);
	title.anchorPoint = ccp(0,0);
    title.position = ccp(70,650);
    [self addChild:title];
    
    /*
    // Fade-in animation for title
    CCActionFadeIn* animatingTitle = [CCActionFadeIn actionWithDuration:3];
    [title runAction:animatingTitle];
	*/
	
	// Animation for the Title text
	
	id moveTitle = [CCActionFadeOut actionWithDuration:3];
	id actionTitle = [CCActionEaseSineInOut actionWithAction:moveTitle];
	id repeatActionTitle = [CCActionRepeatForever actionWithAction:actionTitle];
	[title runAction:repeatActionTitle];
	
	
	//-----------------------------------------------------------------------------------------------------------------------------------
	//Buttons
	
    
    // "How to play" button
    CCButton* howToPlayButton = [CCButton buttonWithTitle:@"How to Play" fontName:@"technoid" fontSize:45];
	howToPlayButton.position = ccp(500,550);
    [howToPlayButton setTarget:self selector:@selector(onHowToPlayClicked:)];
    [self addChild:howToPlayButton];

    
    // "Start" button
    CCButton* startButton = [CCButton buttonWithTitle:@"Start" fontName:@"technoid" fontSize:45];
	startButton.position = ccp(500,450);
    [startButton setTarget:self selector:@selector(onStartClicked:)];
    [self addChild:startButton];
	
	
	/*
	// Fade-in animation for start button
    CCActionFadeIn* animatingStartButton = [CCActionFadeIn actionWithDuration:3];
    [startButton runAction:animatingStartButton];
	 */
	
	
	// "Leaderboards" button
	CCButton* leaderboardsButton = [CCButton buttonWithTitle:@"Leaderboards" fontName:@"technoid" fontSize:45];
	leaderboardsButton.position = ccp(500,350);
    //[leaderboardsButton setTarget:self selector:@selector(onLeaderboardsClicked:)];
    [self addChild:leaderboardsButton];
	
	
	/*
	// Fade-in animation for Leaderboards button
    CCActionFadeIn* animatingLeaderboardsButton = [CCActionFadeIn actionWithDuration:3];
    [leaderboardsButton runAction:animatingLeaderboardsButton];
	*/

	
	// "Options" button
	CCButton* optionsButton = [CCButton buttonWithTitle:@"Options" fontName:@"technoid" fontSize:45];
	optionsButton.position = ccp(500,250);
    [optionsButton setTarget:self selector:@selector(onOptionsClicked:)];
    [self addChild:optionsButton];
	
	
	/*
	// Fade-in animation for Options button
    CCActionFadeIn* animatingOptionsButton = [CCActionFadeIn actionWithDuration:3];
    [optionsButton runAction:animatingOptionsButton];
	 */
	
	
	// "Credits" button
	CCButton* creditsButton = [CCButton buttonWithTitle:@"Credits" fontName:@"technoid" fontSize:45];
	creditsButton.position = ccp(500,150);
    [creditsButton setTarget:self selector:@selector(onCreditsClicked:)];
    [self addChild:creditsButton];
	
	
	/*
	// Fade-in animation for Credits button
    CCActionFadeIn* animatingCreditsButton = [CCActionFadeIn actionWithDuration:3];
    [creditsButton runAction:animatingCreditsButton];
	 */

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
    [[CCDirector sharedDirector] replaceScene:[Game scene] withTransition:[CCTransition transitionFadeWithDuration:2]];
	[[OALSimpleAudio sharedInstance] playEffect:@"startButton_sfx.mp3"];
}


- (void)onLeaderboardsClicked:(id)sender
{

    // Show a Game Center view
    
    GKLeaderboard* leaderBoards = [GKLeaderboard new];

}

 
- (void)onOptionsClicked:(id)sender
{
    // Go to Options Menu
    [[CCDirector sharedDirector] pushScene:[Options scene]];
	[[OALSimpleAudio sharedInstance] playEffect:@"otherButton2_sfx.mp3"];
}

- (void)onCreditsClicked:(id)sender
{
    // Go to Credits Menu
    [[CCDirector sharedDirector] pushScene:[Credits scene]];
	[[OALSimpleAudio sharedInstance] playEffect:@"otherButton2_sfx.mp3"];
}

@end
