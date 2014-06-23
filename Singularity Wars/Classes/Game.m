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
//Joysticks!! - DONE
//Colisões!! - DONE
//Cleanup!! -TDB


#import "Game.h"


@implementation Game

+ (Game *)scene
{
	return [[self alloc] init];
    
}

@synthesize ghost;



- (void) background {
    
    CCSprite* background = [CCSprite spriteWithImageNamed:@"background3.png"];
    [self addChild:background];
    
}


- (void) particles {
    
    CGSize winSize = [CCDirector sharedDirector].viewSize;
    
    CCParticleSystem *particlesSingularity = [CCParticleSystem particleWithFile:@"BlackHole-SingularityWars.plist"];
    particlesSingularity.position = ccp(winSize.width/2,winSize.height/2);
    [self addChild:particlesSingularity];
    
}

- (void) grid {
    
    CGSize winSize = [CCDirector sharedDirector].viewSize;
    
    CCSprite* grid = [CCSprite spriteWithImageNamed:@"grid.png"];
    grid.position = ccp(winSize.width/2,winSize.height/2);
	grid.scale = 0.8;
	grid.opacity = 0.2;
    
    id rotateGrid = [CCActionRotateBy actionWithDuration:60 angle:360];
    id repeatMoveGrid = [CCActionRepeatForever actionWithAction:rotateGrid];
    [grid runAction:repeatMoveGrid];
    [self addChild:grid];
    
    
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

/*
- (void) animateGhost {
    
    
    CCSprite* ghost = [CCSprite spriteWithImageNamed:@"enemy.png"];
    ghost.position = ccp(800,500);

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

    
    // Fade in and out effect for the ghost
    id ghostFadeOut = [CCActionFadeOut actionWithDuration:0.5];
    id ghostFadeIn = [CCActionFadeIn actionWithDuration:0.5];
    id ghostFadeOutIn = [CCActionSequence actionOne:ghostFadeOut two:ghostFadeIn];
    id repeatGhostFadeOutIn = [CCActionRepeatForever actionWithAction:ghostFadeOutIn];
    [ghost runAction:repeatGhostFadeOutIn];
    
    // Move in direction of the Player's ship
    //id moveGhostToShipLocation = [CCActionMoveTo actionWithDuration:10 position:ccp(x,y)];
    //id actionMoveDone = [CCCallFuncN actionWithTarget:self selector:@selector(finishedMoving:)]
    //[ghost runAction:[CCSequence actions:moveGhostToShipLocation, actionMoveDone, nil]];

    
    
    
    [self addChild:ghost];
    

     CCAction *actionMove = [CCActionMoveTo actionWithDuration:randomDuration position:CGPointMake(enemy.contentSize.width/2, randomY)];
     CCAction *actionRemove = [CCActionRemove action];

    
}
*/
-(void) generateRandomCoordinates

{
  
/*
    x = arc4random() % 1536;
    y = arc4random() & 2048;
    
    if(y < 50)
    {
        y = 100;
    }
    
    if (x < 50)
        
    {
        x = 100;
    }
    */
}



- (void) enemyCross {
    
    
    // Cross enemy
    
    CCSprite* cross = [CCSprite spriteWithImageNamed:@"enemy2.png"];
    cross.position = ccp(200,200);
    
    id crossRotation = [CCActionRotateBy actionWithDuration:2 angle:360];
    id repeatCrossRotation = [CCActionRepeatForever actionWithAction:crossRotation];
    
    [cross runAction:repeatCrossRotation];
    [self addChild:cross];
    
}

- (void) enemyCork {
    
    // Cork enemy
    
    CCSprite* cork = [CCSprite spriteWithImageNamed:@"enemy3.png"];
    cork.position = ccp(400,400);
    cork.scale = 0.7;
    
    id corkRotation = [CCActionRotateBy actionWithDuration:1 angle:-360];
    id repeatCorkRotation = [CCActionRepeatForever actionWithAction:corkRotation];
    
    
    [cork runAction:repeatCorkRotation];
    [self addChild:cork];

    
    
}



- (void) collisions {
    
    

}


- (void) labels {
    

    
    
    //-----------------------------------------------------------------------------------------------------------------------------------
    
    // The "Pause" button
    
    CCButton* pauseButton = [CCButton buttonWithTitle:@"Pause" fontName:@"technoid" fontSize:30];
    pauseButton.color = [CCColor whiteColor];
    pauseButton.position = ccp(900,750);
    [pauseButton setTarget:self selector:@selector(onPauseClicked:)];
    [self addChild:pauseButton];

    
}

- (void) GameOver {
    
    [[CCDirector sharedDirector] pushScene:[GameOver scene]];
    
    
}

//-----------------------------------------------------------------------------------------------------------------------------------

// Background Music

- (void) sound {
    
    // Background music track
    [[OALSimpleAudio sharedInstance] playBg:@"game.m4a" loop:YES];
}


//-----------------------------------------------------------------------------------------------------------------------------------

// Update Callback, responsible for updating the position of the ship according the Left Joystick velocity, shooting with the right joystick, detecting collisions, etc...

 -(void) update:(CCTime)deltaTime {
   
     
     
     CGSize winSize = [CCDirector sharedDirector].viewSize;
     
     
     // "Lifes" Label, updated everytime the player loses a life
     
     [lifesLbl setString:[NSString stringWithFormat:@"Lifes: %i",lifes]];
     
     
     
     // Logic for updating the position of the ship at each frame
     
     CGPoint scaledVelocity = ccpMult(leftJoystick.velocity, 400);
     CGPoint newPosition = ccp(Ship.position.x + scaledVelocity.x * deltaTime, Ship.position.y + scaledVelocity.y * deltaTime);
     
     [Ship setPosition:newPosition];
     
     
     
     // Logic for shooting lasers with the right joystick
    
     if (rightJoystick.velocity.x != 0 && rightJoystick.velocity.y != 0)
     
     {
         
         CGPoint velocity = rightJoystick.velocity;
         CCLOG(@"%.5f //// %.5f",velocity.x,velocity.y);
         velocity = ccpMult(ccpNormalize(velocity), 1500);
    
         laser = [CCSprite spriteWithImageNamed:@"fire.png"];
         laser.color = [CCColor redColor];
         laser.position = Ship.position;
         
         [laser runAction:[CCActionMoveBy actionWithDuration:1 position:velocity]];
         [self addChild:laser];

         }
     
     
     //Detect collisions between Ship and Enemy
     
     if (CGRectIntersectsRect(ghost.boundingBox, Ship.boundingBox)) {
         [[OALSimpleAudio sharedInstance] playEffect:@"explosion.mp3"];
         ghost.visible = NO;
         Ship.visible = NO;
         [ghost removeFromParentAndCleanup:YES];
         [Ship stopAllActions];
         
         Ship.visible = YES;
         Ship.position = ccp(winSize.width/2,winSize.height/2);
         [Ship runAction:[CCActionBlink actionWithDuration:1.0 blinks:9]];
         
         lifes--;
         NSLog(@"You lost a life!");
     }
     
    // Detect collisions between lasers and enemies
    
     if (CGRectIntersectsRect(ghost.boundingBox, laser.boundingBox)) {
         [[OALSimpleAudio sharedInstance] playEffect:@"explosion.mp3"];
         ghost.visible = NO;
         [ghost stopAllActions];
         //laser.visible = YES;

     }

     if(lifes <= 0){
         
         [Ship stopAllActions];
         [self GameOver];
         
     }
     
 }
- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    if (!self) return(nil);
    
     self.userInteractionEnabled = YES;
     self.multipleTouchEnabled = YES;
    
    CGSize winSize = [CCDirector sharedDirector].viewSize;
     
    Ship = [CCSprite spriteWithImageNamed:@"ship.png"];
    Ship.position = ccp(winSize.width/2,winSize.height/2);
    
    ghost = [CCSprite spriteWithImageNamed:@"enemy.png"];
    ghost.position = ccp(800,500);

    
    lifes = 3;
    
    lifesLbl = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"Lifes: %i",lifes] fontName:@"technoid" fontSize:30];
    
    lifesLbl.outlineColor = [CCColor blackColor];
    lifesLbl.outlineWidth = 1;
    lifesLbl.shadowColor = [CCColor blackColor];
    lifesLbl.shadowOffset = ccp(1,1);
    lifesLbl.position = ccp(150,750);
    
    // Calling in all previously defined functions
    
    [self background];
    [self particles];
    [self grid];
    [self enemyCross];
    [self enemyCork];
    [self collisions];
    [self labels];
    [self addChild:lifesLbl];
    [self sound];
    [self addChild:Ship];
    [self addChild:ghost];
    [self initJoystick];
    [self initJoystickShooting];

     // done
	return self;
    
}



// Event for tapping the "Pause" button

- (void)onPauseClicked:(id)sender
{
    // Pause the game
    [[CCDirector sharedDirector] pushScene:[Pause scene]];
    [[OALSimpleAudio sharedInstance] playEffect:@"startButton_sfx.mp3"];
	
}

@end