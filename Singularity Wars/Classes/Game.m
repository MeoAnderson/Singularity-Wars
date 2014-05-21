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


//TAREFAS PARA HOJE 19/05/14
//IMPLEMENTAR CLASSE NAVE (PLAYER)
//IMPLEMENTAR INIMIGOS


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

    //-----------------------------------------------------------------------------------------------------------------------------------
    
    // Gameplay timer - TBD
    // To be done

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
    
    // Grid sprite
    
    CCSprite* grid = [CCSprite spriteWithImageNamed:@"grid.png"];
    grid.position = ccp(winSize.width/2,winSize.height/2);
	grid.scale = 0.8;
	grid.opacity = 0.2;
    
    id rotateGrid = [CCActionRotateBy actionWithDuration:60 angle:360];
    id repeatMoveGrid = [CCActionRepeatForever actionWithAction:rotateGrid];
    [grid runAction:repeatMoveGrid];
    [self addChild:grid];

    //-----------------------------------------------------------------------------------------------------------------------------------
    
    //Character sprites, animation & other atributes
    
    // Player's ship
    CCSprite* myShip = [CCSprite spriteWithImageNamed:@"ship.png"];
    myShip.position = ccp(winSize.width/2,winSize.height/2);
    //[myShip setTarget:self selector:@selector(onShipMovement:)];
    [self addChild:myShip];
    
    // Enemy
    CCSprite* enemy = [CCSprite spriteWithImageNamed:@"enemy.png"];
    enemy.position = ccp(600,600);
    
    id enemyFadeOut = [CCActionFadeOut actionWithDuration:0.5];
    id enemyFadeIn = [CCActionFadeIn actionWithDuration:0.5];
    id enemyFadeOutIn = [CCActionSequence actionOne:enemyFadeOut two:enemyFadeIn];
    id repeatEnemyFadeOutIn = [CCActionRepeatForever actionWithAction:enemyFadeOutIn];
    id moveEnemyToShipLocation = [CCActionMoveTo actionWithDuration:10 position:ccp(0,0)];
    [enemy runAction:moveEnemyToShipLocation];
    [enemy runAction:repeatEnemyFadeOutIn];
    [self addChild:enemy];
    
    // Enemy 2
    CCSprite* enemy2 = [CCSprite spriteWithImageNamed:@"enemy2.png"];
    enemy2.position = ccp(200,200);
    
    id enemy2Rotation = [CCActionRotateBy actionWithDuration:2 angle:360];
    id repeatEnemy2Rotation = [CCActionRepeatForever actionWithAction:enemy2Rotation];
    [enemy2 runAction:repeatEnemy2Rotation];
    [self addChild:enemy2];
    
    // Enemy 3
    CCSprite* enemy3 = [CCSprite spriteWithImageNamed:@"enemy3.png"];
    enemy3.position = ccp(400,400);
    enemy3.scale = 0.7;
    id enemy3Rotation = [CCActionRotateBy actionWithDuration:1 angle:-360];
    id repeatEnemy3Rotation = [CCActionRepeatForever actionWithAction:enemy3Rotation];
    [enemy3 runAction:repeatEnemy3Rotation];
    [self addChild:enemy3];

    //-----------------------------------------------------------------------------------------------------------------------------------
    
    // Labels
    
    // The "time elapsed" label
    CCLabelTTF* timeElapsed = [CCLabelTTF labelWithString:@"Time Elapsed: " fontName:@"technoid" fontSize:30];
	
	timeElapsed.outlineColor = [CCColor blackColor];
	timeElapsed.outlineWidth = 1;
	timeElapsed.shadowColor = [CCColor blackColor];
	timeElapsed.shadowOffset = ccp(1,1);
    timeElapsed.position = ccp(150,750);
    [self addChild:timeElapsed];

    
    // The "score" label
    CCLabelTTF* score = [CCLabelTTF labelWithString:@"Score: " fontName:@"technoid" fontSize:30];
	
	score.outlineColor = [CCColor blackColor];
	score.outlineWidth = 1;
	score.shadowColor = [CCColor blackColor];
	score.shadowOffset = ccp(1,1);
    score.position = ccp(85,700);
    [self addChild:score];
    
    //-----------------------------------------------------------------------------------------------------------------------------------

    // The "Pause" button
    
    CCButton* pauseButton = [CCButton buttonWithTitle:@"Pause" fontName:@"technoid" fontSize:30];
    pauseButton.color = [CCColor whiteColor];
    pauseButton.position = ccp(900,700);
    [pauseButton setTarget:self selector:@selector(onPauseClicked:)];
    [self addChild:pauseButton];

//-----------------------------------------------------------------------------------------------------------------------------------
    
    // Joystiq for controlling the ship
    /*
    SneakyJoystickSkinnedJoystickExample* movementJoystiq = [SneakyJoystickSkinnedJoystickExample spriteWithImageNamed:@"testJoystiq.png"];
    movementJoystiq.position = ccp(150, 150);
    movementJoystiq.scale = 0.5;
    movementJoystiq.opacity = 0.5;
    
    [self addChild:movementJoystiq];
    
    
    // Joystiq for controlling the direction the ship is shooting and facing
    
    SneakyJoystickSkinnedJoystickExample* shootingJoystiq = [SneakyJoystickSkinnedJoystickExample spriteWithImageNamed:@"testJoystiq.png"];
    shootingJoystiq.position = ccp(850,150);
    shootingJoystiq.scale = 0.5;
    shootingJoystiq.opacity = 0.5;
    [self addChild:shootingJoystiq];
*/
    
    
    ZJoystick* leftJoystiq = [ZJoystick joystickNormalSpriteFile:@"Joystick_norm.png" selectedSpriteFile:@"JoystickContainer_norm.png" controllerSpriteFile:@"JoystickContainer_trans.png"];
    
    leftJoystiq.position = ccp(150,150);
    
    [self addChild:leftJoystiq];
    
    
    
    // Background music for game
    [[OALSimpleAudio sharedInstance] playBg:@"game.m4a" loop:YES];
    
     // done
	return self;
     
}

/*
- (void)tick:(float)delta

{

    [self applyJoystiq:movementJoystiq toNode];

}
*/
- (void)onPauseClicked:(id)sender
{
    // Pause the game
    [[CCDirector sharedDirector] pushScene:[Pause scene]];
    [[OALSimpleAudio sharedInstance] playEffect:@"startButton_sfx.mp3"];
	
}


@end

//LEFTOVER CODE
/*

 CCSprite* shipMovementJoystiq = [CCSprite spriteWithImageNamed:@"testJoystiq.png"];
 shipMovementJoystiq.position = ccp(150,150);
 shipMovementJoystiq.scale = 0.5;
 [self addChild:shipMovementJoystiq];

 CCSprite* shipShootingJoystiq = [CCSprite spriteWithImageNamed:@"testJoystiq.png"];
 shipShootingJoystiq.position = ccp(850,150);
 shipShootingJoystiq.scale = 0.5;
 [self addChild:shipShootingJoystiq];
 
*/