//
//  Pause.m
//  Singularity Wars
//
//  Created by Vasco Patrício on 10/03/14.
//  Copyright (c) 2014 Vasco Patrício. All rights reserved.
//

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
    
    // Sprite with background
    CCSprite* background = [CCSprite spriteWithImageNamed:@"background3.png"];
    [self addChild:background];
    
    
    // "Back to Main Menu" button
    
    CCButton *backMainMenuButton = [CCButton buttonWithTitle:@"Back to Main Menu" fontName:@"technoid" fontSize:45];
    backMainMenuButton.position = ccp(winSize.width/2,winSize.height/3);
    [backMainMenuButton setTarget:self selector:@selector(onBackMainMenuClicked:)];
    [self addChild:backMainMenuButton];
    
    // done
	return self;
}


- (void)onBackMainMenuClicked:(id)sender
{
    // Back to Main Menu
    
    [[CCDirector sharedDirector] popSceneWithTransition:[CCTransition transitionCrossFadeWithDuration:0.1]];
    [[OALSimpleAudio sharedInstance] playEffect:@"Button2_sfx.mp3"];
}

@end
