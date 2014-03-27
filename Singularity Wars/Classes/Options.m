//
//  IntroScene.m
//  Singularity Wars
//
//  Created by Vasco Patrício on 06/03/14.
//  Copyright Vasco Patrício 2014. All rights reserved.
//
// -----------------------------------------------------------------------

#import "Options.h"
#import "Menu.h"

@implementation Options

+ (Options *)scene
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
    
    
    // Sprite with background
    CCSprite* background = [CCSprite spriteWithImageNamed:@"background3.png"];
    [self addChild:background];
    
    
    // "Options" title label
    CCLabelTTF* optionsTitle = [CCLabelTTF labelWithString:@"Options" fontName:@"technoid" fontSize:80];
	optionsTitle.outlineColor = [CCColor grayColor];
	optionsTitle.outlineWidth = 0.5;
	optionsTitle.shadowColor = [CCColor grayColor];
	optionsTitle.shadowOffset = ccp(1,1);
    optionsTitle.position = ccp(winSize.width/2,winSize.height-100);
    [self addChild:optionsTitle];

    
    // Add particles to the scene
    CCParticleGalaxy* particlesGalaxy = [CCParticleGalaxy particleWithTotalParticles:3000];
	particlesGalaxy.sourcePosition = ccp(0,0);
	particlesGalaxy.emissionRate = 500;
	particlesGalaxy.duration = -1;
	particlesGalaxy.life = 5.0f;
	
	[self addChild:particlesGalaxy];

    
    // "Back to Main Menu" scene button
    CCButton *backToMenuButton = [CCButton buttonWithTitle:@"Back to Main Menu" fontName:@"technoid" fontSize:45];
    backToMenuButton.positionType = CCPositionTypeNormalized;
    backToMenuButton.position = ccp(0.5f, 0.2f);
    [backToMenuButton setTarget:self selector:@selector(onBackToMenuClicked:)];
    [self addChild:backToMenuButton];

    // done
	return self;
}

- (void)onBackToMenuClicked:(id)sender
{
    // Going back to the Menu (NOT WORKING CORRECTLY, MOST LIKELY A COCOS2D BUG)
    
    [[CCDirector sharedDirector] popSceneWithTransition:[CCTransition transitionCrossFadeWithDuration:0.1]];
    
    //[[CCDirector sharedDirector] replaceScene:[Menu scene] withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionRight duration:0.2f]];
    
    [[OALSimpleAudio sharedInstance] playEffect:@"otherButton2_sfx.mp3"];
    
}

@end
