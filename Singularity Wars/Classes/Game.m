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


//TAREFAS PARA HOJE 22/06/14
//Joysticks!! - UPDATE: vamos lá meter esta merda a trabalhar
//Colisões!!


#import "Game.h"

@implementation Game

+ (Game *)scene
{
	return [[self alloc] init];
}

// Create Joystick for Movement

- (void) initJoystick {
    
    SneakyJoystickSkinnedBase* leftJoy = [[SneakyJoystickSkinnedBase alloc] init];
    leftJoy.backgroundSprite = [CCSprite spriteWithImageNamed:@"testJoystiq.png"];
    leftJoy.thumbSprite = [CCSprite spriteWithImageNamed:@"testJoystiq.png"];
    leftJoy.joystick = [[SneakyJoystick alloc] initWithRect:CGRectMake(0, 0, 200, 200)];
    leftJoy.position = ccp(150,150);
    leftJoy.scale = 0.6;
    
    leftJoystick = leftJoy.joystick;
    [self addChild:leftJoy];
    
}

// Create Joystick for shooting

- (void) initJoystickShooting {
    
    SneakyJoystickSkinnedBase* rightJoy = [[SneakyJoystickSkinnedBase alloc] init];
    rightJoy.backgroundSprite = [CCSprite spriteWithImageNamed:@"testJoystiq.png"];
    rightJoy.thumbSprite = [CCSprite spriteWithImageNamed:@"testJoystiq.png"];
    rightJoy.joystick = [[SneakyJoystick alloc] initWithRect:CGRectMake(0, 0, 200, 200)];
    rightJoy.position = ccp(875,150);
    rightJoy.scale = 0.6;

    rightJoystick = rightJoy.joystick;
    [self addChild:rightJoy];
    
    }

// Update callback for every frame, responsible for updating the position of the ship as well as the shooting

 -(void) update:(CCTime)deltaTime {
     
     CGPoint scaledVelocity = ccpMult(leftJoystick.velocity, 240);
     CGPoint newPosition = ccp(Ship.position.x + scaledVelocity.x * deltaTime, Ship.position.y + scaledVelocity.y * deltaTime);
 
     if (newPosition.y>320) {
         newPosition.y=newPosition.y-320;
     }
     if (newPosition.y<320) {
         newPosition.y=newPosition.y+320;
     }
 
     if (newPosition.x>480) {
         newPosition.x=newPosition.x-480;
     }
     if (newPosition.x<480) {
         newPosition.x=newPosition.x+480;
 
         [Ship setPosition:newPosition];
        
    }
 }



- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
    
    // Get the size of the window
	CGSize winSize = [CCDirector sharedDirector].viewSize;

    
     self.userInteractionEnabled = YES;
     self.multipleTouchEnabled = YES;
    
  
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
    
    
    //My ship
    CCSprite* Ship = [CCSprite spriteWithImageNamed:@"ship.png"];
    Ship.position = ccp(winSize.width/2,winSize.height/2);
    [self addChild:Ship];
    
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    // Ghost Enemy (Sprite creation, positioning off-screen, etc TBD)
    
    
    CCSprite* enemy = [CCSprite spriteWithImageNamed:@"enemy.png"];
    enemy.position = ccp(800,500);
    
    /*
    int minY = enemy.contentSize.height / 2;// Variable for size
    int maxY = self.contentSize.height - enemy.contentSize.height / 2;
    int rangeY = maxY - minY;
    int randomY = (arc4random() % rangeY) + minY;
    
    enemy.position = CGPointMake(self.contentSize.width + enemy.contentSize.width/2, randomY);
    
    int minDuration = 2.0;
    int maxDuration = 4.0;
    int rangeDuration = maxDuration - minDuration;
    int randomDuration = (arc4random() % rangeDuration) + minDuration;
    CCAction *actionMove = [CCActionMoveTo actionWithDuration:randomDuration position:CGPointMake(enemy.contentSize.width/2, randomY)];
    CCAction *actionRemove = [CCActionRemove action];
    
    [enemy runAction:[CCActionSequence actionWithArray:@[actionMove,actionRemove]]];
     */

    // Para aplicar fade in e out ao Ghost
    id enemyFadeOut = [CCActionFadeOut actionWithDuration:0.5];
    id enemyFadeIn = [CCActionFadeIn actionWithDuration:0.5];
    id enemyFadeOutIn = [CCActionSequence actionOne:enemyFadeOut two:enemyFadeIn];
    id repeatEnemyFadeOutIn = [CCActionRepeatForever actionWithAction:enemyFadeOutIn];
    [enemy runAction:repeatEnemyFadeOutIn];
    
    // Para mover
    //id moveEnemyToShipLocation = [CCActionMoveTo actionWithDuration:10 position:ccp(0,0)];
    //[enemy runAction:moveEnemyToShipLocation];
    
    
    
    [self addChild:enemy];
    
/*
    CCAction *actionMove = [CCActionMoveTo actionWithDuration:randomDuration position:CGPointMake(enemy.contentSize.width/2, randomY)];
    CCAction *actionRemove = [CCActionRemove action];
*/
    
    
    //-----------------------------------------------------------------------------------------------------------------------------------
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
    pauseButton.position = ccp(900,750);
    [pauseButton setTarget:self selector:@selector(onPauseClicked:)];
    [self addChild:pauseButton];

    //-----------------------------------------------------------------------------------------------------------------------------------
    
    // Background music for game
    
    [[OALSimpleAudio sharedInstance] playBg:@"game.m4a" loop:YES];

    [self initJoystick];
    [self initJoystickShooting];
    
    
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