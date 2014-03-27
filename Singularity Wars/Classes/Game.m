//
//  Game.m
//  Singularity Wars
//
//  Created by Vasco Patrício on 07/03/14.
//  Copyright (c) 2014 Vasco Patrício. All rights reserved.
//
// -----------------------------------------------------------------------


#import "Game.h"

@implementation Game

+ (Game *)scene
{
	return [[self alloc] init];
}
- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
     self.userInteractionEnabled = YES;
     self.multipleTouchEnabled = YES;
    
    // Get the size of the window
	CGSize winSize = [CCDirector sharedDirector].viewSize;
    
    // Background music for game
    [[OALSimpleAudio sharedInstance] playBg:@"game.m4a" loop:YES];
    
    
    // Gameplay timer - TBD

    
    // Sprite with background
    CCSprite* background = [CCSprite spriteWithImageNamed:@"background3.png"];
    [self addChild:background];
    
    // Particles
    CCParticleExplosion* particlesBackground = [CCParticleExplosion particleWithTotalParticles:2000];
	particlesBackground.color = [CCColor orangeColor];
    particlesBackground.speed = 150.0f;
    particlesBackground.duration = -1;
    particlesBackground.emissionRate = 700;
    particlesBackground.sourcePosition = ccp(0,0);
    [self addChild:particlesBackground];
    
    CCSprite* grid = [CCSprite spriteWithImageNamed:@"grid.png"];
    grid.position = ccp(winSize.width/2,winSize.height/2);
	grid.scale = 0.6;
	grid.opacity = 0.5;
    [self addChild:grid];
    
    id move = [CCActionEaseElastic actionWithDuration:20];
    id moveGrid = [CCActionEaseSineInOut actionWithAction:move];
    id repeatMoveGrid = [CCActionRepeatForever actionWithAction:moveGrid];
    [grid runAction:repeatMoveGrid];
    
    
    // The "time elapsed" label
    CCLabelTTF* timeElapsed = [CCLabelTTF labelWithString:@"Time Elapsed: " fontName:@"technoid" fontSize:30];
	
	timeElapsed.outlineColor = [CCColor blackColor];
	timeElapsed.outlineWidth = 1;
	timeElapsed.shadowColor = [CCColor blackColor];
	timeElapsed.shadowOffset = ccp(1,1);
	timeElapsed.anchorPoint = ccp(0,0);
    timeElapsed.position = ccp(50,700);
    [self addChild:timeElapsed];

    
    // The "score" label
    CCLabelTTF* score = [CCLabelTTF labelWithString:@"Score: " fontName:@"technoid" fontSize:30];
	
	score.outlineColor = [CCColor blackColor];
	score.outlineWidth = 1;
	score.shadowColor = [CCColor blackColor];
	score.shadowOffset = ccp(1,1);
	score.anchorPoint = ccp(0,0);
    score.position = ccp(50,650);
    [self addChild:score];

    
    // The "pause" button
    
    CCButton* pauseButton = [CCButton buttonWithTitle:@"Pause" fontName:@"technoid" fontSize:30];
    pauseButton.color = [CCColor whiteColor];
    pauseButton.position = ccp(900,700);
    [pauseButton setTarget:self selector:@selector(onPauseClicked:)];
    [self addChild:pauseButton];

    
    // Character's ship
    CCSprite* myShip = [CCSprite spriteWithImageNamed:@"testeShip2.png"];
    myShip.position = ccp(winSize.width/2,winSize.height/2);
    //[myShip setTarget:self selector:@selector(onShipMovement:)];
    [self addChild:myShip];
    
    // Joystiq for controlling the ship
    
    CCSprite* shipMovementJoystiq = [CCSprite spriteWithImageNamed:@"testJoystiq.png"];
    shipMovementJoystiq.position = ccp(150,150);
    shipMovementJoystiq.scale = 0.5;
    [self addChild:shipMovementJoystiq];
    
    // Joystiq for controlling the direction the ship is shooting and facing
    
    CCSprite* shipShootingJoystiq = [CCSprite spriteWithImageNamed:@"testJoystiq.png"];
    shipShootingJoystiq.position = ccp(850,150);
    shipShootingJoystiq.scale = 0.5;
    [self addChild:shipShootingJoystiq];
    
     // done
	return self;
     
}

- (void)onPauseClicked:(id)sender
{
    // Pause the game
    [[CCDirector sharedDirector] pushScene:[Pause scene]];
    [[OALSimpleAudio sharedInstance] playEffect:@"startButton_sfx.mp3"];
	
}


@end


//LEFTOVER CODE

/*FUCKING SNEAKYINPUT
 // Add SneakyInput Joystiq for ship movement
 
 SneakyJoystickSkinnedBase* shipMovementButton = [SneakyJoystickSkinnedBase spriteWithImageNamed:@"testJoystiq.png"];
 shipMovementButton.scale = 0.5;
 shipMovementButton.position = ccp(150,150);
 shipMovementButton.isUserInteractionEnabled = YES;
 [self addChild:shipMovementButton];
 
 // Add SneakyInput Joystiq for ship shooting
 
 SneakyJoystickSkinnedBase* shipShooting = [SneakyJoystickSkinnedBase spriteWithImageNamed:@"testJoystiq.png"];
 shipShooting.scale = 0.5;
 shipShooting.position = ccp(850,150);
 [self addChild:shipShooting];
 
 -(void)tick:(float)delta {
  This will take the joystick and tell a special method (not listed here, outside the scope of this guide) to take the joystick, apply movement to hero (CCSprite or else) and apply the real delta (to avoid uneven or choppy movement, delta is the time since the last time the method was called, in milliseconds).
 [self applyJoystick:leftJoystick toNode:shipMovement forTimeDelta:delta];
 }
 */
