//
//  JJMyScene.m
//  ClassicBreakTilesGame
//
//  Created by Jash Jacob on 07/11/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJMyScene.h"
#import "JJEndScene.h"

@interface JJMyScene ()

@property (nonatomic) SKSpriteNode *paddle;

@end

static const uint32_t ballCategory   = 1; //00000000000000000000000000000001
static const uint32_t brickCategory  = 2; //00000000000000000000000000000010
static const uint32_t paddleCategory = 4; //00000000000000000000000000000100
static const uint32_t edgeCategory   = 8; //00000000000000000000000000001000
static const uint32_t bottomEdgeCategory = 16;

// Alternatively using Bit Wise operators
/*
static const uint32_t ballCategory   = 0x1;      //00000000000000000000000000000001
static const uint32_t brickCategory  = 0x1 << 1; //00000000000000000000000000000010
static const uint32_t paddleCategory = 0x1 << 2;
static const uint32_t edgeCategory   = 0x1 << 3;
*/


@implementation JJMyScene

-(void)didBeginContact:(SKPhysicsContact *)contact{
    
//    if (contact.bodyA.categoryBitMask == brickCategory) {
//        NSLog(@"BodyA is a brick");
//        [contact.bodyA.node removeFromParent];
//    }
//    if (contact.bodyB.categoryBitMask == brickCategory)
//    {
//        NSLog(@"BodyB is a brick");
//        [contact.bodyB.node removeFromParent];
//    }
    
    //create a placeholer reference for the "non ball" object
    SKPhysicsBody *notTheBall;
    
    
    SKAction *brickBreakSound = [SKAction playSoundFileNamed:@"brickhit.caf" waitForCompletion:NO];
    SKAction *paddleSound = [SKAction playSoundFileNamed:@"blip.caf" waitForCompletion:NO];
    
    JJEndScene *end = [JJEndScene sceneWithSize:self.size]; //create another view of type EndScene
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask) { //checking if the bodyA is category ball cause bitmask value is 1
        notTheBall = contact.bodyB; //assign notTheBall to be the brickcategory of bodyB which makes ball the bodyA
    }
    else
    {
        notTheBall = contact.bodyA; //assign notTheBall to be the brickcategory of bodyA which makes ball the body B
    }
    
    if(notTheBall.categoryBitMask == bottomEdgeCategory)
    {
        NSLog(@"OMG! GAMEOVER!");
        [self.view presentScene:end transition:[SKTransition fadeWithDuration:1.0]];
    }
    
    
    if(notTheBall.categoryBitMask == brickCategory)
    {
        NSLog(@"It's a brick");
        
        int randomBrickBreak = arc4random()%5;
        
        if( randomBrickBreak < 3)
        {
            [self runAction:brickBreakSound];
            [notTheBall.node removeFromParent];
            NSLog(@"Brick broken");
        }
    }
    
    if (notTheBall.categoryBitMask == paddleCategory)
    {
        NSLog(@"Play Boing sound");
        [self runAction:paddleSound];
    }

    
}

-(void) addBottomEdge: (CGSize) size
{
    SKNode *bottomEdge = [SKNode node];
    bottomEdge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0, 4) toPoint:CGPointMake(size.width, 4)];
    
    bottomEdge.physicsBody.categoryBitMask = bottomEdgeCategory;
    [self addChild:bottomEdge];
}


- (void)addBall:(CGSize)size {
    //create a new sprite
    SKSpriteNode *ball = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
    
    //create CGPoint for position
    CGPoint myPoint = CGPointMake(size.width/2, 101); //place ball over the paddle
    ball.position = myPoint;
    
    //add physicsBody for the ball
    ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.frame.size.width/2];
    ball.physicsBody.friction = 0;
    ball.physicsBody.linearDamping = 0;
    ball.physicsBody.restitution = 1 ; //energy lost on impact or bounciness
    
    
    ball.physicsBody.categoryBitMask = ballCategory; //setting categoryBitMask to know what category ball is associated with
    ball.physicsBody.contactTestBitMask = brickCategory | paddleCategory | bottomEdgeCategory; //to know the contact of ball with Brick or Paddle
    //ball.physicsBody.collisionBitMask = edgeCategory | brickCategory; // to allow the ball to collide only with edge and brick
    
    //add sprite node to the scene
    [self addChild:ball];
    
    
    CGFloat angle = arc4random_uniform(1000)/1000.0 * M_PI_2;
    CGFloat magnitude = 7;
    
    //create the vector
    CGVector vector = CGVectorMake(magnitude*cos(angle), magnitude*sin(angle));
    
    // apply the vector
    [ball.physicsBody applyImpulse:vector];
}

-(void) addBricks: (CGSize) size
{
    for(int i=0; i<4; i++)
    {
        SKSpriteNode *brick = [SKSpriteNode spriteNodeWithImageNamed:@"brick"];
        
        //add a static physics body
        brick.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:brick.frame.size];
        brick.physicsBody.dynamic = NO;
        brick.physicsBody.categoryBitMask = brickCategory;
        
        int xPos = size.width/5 * (i+1);
        int yPos = size.height - 120;
        
        brick.position = CGPointMake(xPos, yPos);
        
        [self addChild:brick];
    }
    
    for(int i=0; i<4; i++)
    {
        SKSpriteNode *brick = [SKSpriteNode spriteNodeWithImageNamed:@"brick"];
        
        //add a static physics body
        brick.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:brick.frame.size];
        brick.physicsBody.dynamic = NO;
        brick.physicsBody.categoryBitMask = brickCategory;
        
        int xPos = size.width/5 * (i+1);
        int yPos = size.height - 80;
        
        brick.position = CGPointMake(xPos, yPos);
        
        [self addChild:brick];
    }
    
    for(int i=0; i<4; i++)
    {
        SKSpriteNode *brick = [SKSpriteNode spriteNodeWithImageNamed:@"brick"];
        
        //add a static physics body
        brick.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:brick.frame.size];
        brick.physicsBody.dynamic = NO;
        brick.physicsBody.categoryBitMask = brickCategory;
        
        int xPos = size.width/5 * (i+1);
        int yPos = size.height - 40;
        
        brick.position = CGPointMake(xPos, yPos);
        
        [self addChild:brick];
    }
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInNode:self];
        CGPoint newPosition = CGPointMake(location.x, 100);
        
        //stop the paddle from escaping the scene
        
        if( newPosition.x < self.paddle.size.width/2)
        {
            newPosition.x = self.paddle.size.width/2;
        }
        if(newPosition.x > self.size.width - (self.paddle.size.width/2))
        {
            newPosition.x = self.size.width - (self.paddle.size.width/2);
        }
        
        self.paddle.position = newPosition;
        
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches)
    {
        CGPoint location = [touch locationInNode:self];
        CGPoint newPosition = CGPointMake(location.x, 100);
    
        if( newPosition.x < self.paddle.size.width/2)
        {
            newPosition.x = self.paddle.size.width/2;
        }
        if(newPosition.x > self.size.width - (self.paddle.size.width/2))
        {
            newPosition.x = self.size.width - (self.paddle.size.width/2);
        }
        
        self.paddle.position = newPosition;
        
    }
    
}


-(void)addPlayer:(CGSize)size
{
    //create paddle sprite
    self.paddle = [SKSpriteNode spriteNodeWithImageNamed:@"paddle"];
    
    //position
    self.paddle.position = CGPointMake(size.width/2, 100);
    //add a physics body
    self.paddle.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.paddle.frame.size];
    self.paddle.physicsBody.dynamic = NO;
    self.paddle.physicsBody.categoryBitMask = paddleCategory;
    
    //add to scene
    [self addChild:self.paddle];
    
    
}

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor whiteColor];
        
        //add a physicsBody to the background in the scene
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        self.physicsBody.categoryBitMask = edgeCategory;
        
        //change gravity of physicsWorld
        self.physicsWorld.gravity = CGVectorMake(0, 0);
        
        self.physicsWorld.contactDelegate = self; //making contact to check in the same class to the method -didBeginContact
        
        [self addBall:size];
        [self addPlayer:size];
        [self addBricks:size];
        [self addBottomEdge:size];
        
    }
    return self;
}



-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
