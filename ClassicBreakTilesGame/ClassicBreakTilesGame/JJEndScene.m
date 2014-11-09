//
//  JJEndScene.m
//  ClassicBreakTilesGame
//
//  Created by Jash Jacob on 08/11/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJEndScene.h"
#import "JJMyScene.h"

@implementation JJEndScene

-(instancetype)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size])
    {
        
        self.backgroundColor = [SKColor blackColor];
        
        SKAction *playSFX = [SKAction playSoundFileNamed:@"gameover.caf" waitForCompletion:NO];
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        label.text = @"GAME OVER!";
        label.fontColor = [SKColor whiteColor];
        label.fontSize = 40;
        label.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        [self addChild:label];
        [self runAction:playSFX];
        
        
        //second label
        SKLabelNode *tryAgain = [ SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        tryAgain.text = @"Try Again?";
        tryAgain.fontColor = [SKColor whiteColor];
        tryAgain.fontSize = 24;
        tryAgain.position = CGPointMake(size.width/2, -50);
        
        SKAction *moveLabel = [SKAction moveToY:(size.height/2-40) duration:1.0];
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
