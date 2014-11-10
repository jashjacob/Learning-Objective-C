//
//  JJMyScene.m
//  FloatingSpaceship
//
//  Created by Jash Jacob on 10/11/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJMyScene.h"

@implementation JJMyScene{
    SKSpriteNode *ship;
    SKEmitterNode *engine;
    BOOL screenTouch;
    
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        ship = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        ship.position = CGPointMake(size.width/2, size.height/2);
        ship.scale = 0.3;
        ship.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ship.size];
        [self addChild:ship];
        
        engine = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle]pathForResource:@"EngineParticle" ofType:@"sks"]];
        
        engine.numParticlesToEmit = 1;
        
        engine.position =CGPointMake(0, -180);
        [ship addChild:engine];
        
        //add edge to scene
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        
        //set gravity
        self.physicsWorld.gravity = CGVectorMake(0, -1);
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    screenTouch = YES;
    engine.numParticlesToEmit = 0;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    screenTouch = NO;
    engine.numParticlesToEmit = 100;
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    //if YES - apply upward force
    if(screenTouch)
    {
        [ship.physicsBody applyForce:CGVectorMake(0, 150)];
    }

}

@end
