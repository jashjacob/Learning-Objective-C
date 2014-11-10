//
//  JJWonScene.m
//  ClassicBreakTilesGame
//
//  Created by Jash Jacob on 10/11/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJWonScene.h"
#import "JJMyScene.h"

@implementation JJWonScene

-(instancetype) initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size])
    {
        
        SKAction *playSFX = [SKAction playSoundFileNamed:@"applause.caf" waitForCompletion:NO];
        
        //gamewon label
        SKLabelNode *gamewon = [SKLabelNode labelNodeWithFontNamed:@"Avenir"];
        gamewon.text = @"GAME WON!";
        gamewon.fontColor = [SKColor whiteColor];
        gamewon.fontSize = 40;
        gamewon.position =  CGPointMake(size.width/2, size.height/2);
        
        [self addChild:gamewon];
        [self runAction:playSFX];
        
        //tryagain label
        SKLabelNode *tryAgain = [ SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        tryAgain.text = @"Play Again?";
        tryAgain.fontColor = [SKColor redColor];
        tryAgain.fontSize = 24;
        tryAgain.position = CGPointMake(size.width/2, -50);
        
        SKAction *moveLabel = [SKAction moveToY:(size.height/2-40) duration:0.7];
        [tryAgain runAction:moveLabel];
        
        [self addChild:tryAgain];
        
    }
    
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    JJMyScene *firstScene = [JJMyScene sceneWithSize:self.size];
    [self.view presentScene:firstScene transition:[SKTransition fadeWithColor:[SKColor whiteColor] duration:1.2]];
}

@end

