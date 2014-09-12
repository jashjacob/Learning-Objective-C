//
//  JJFactory.h
//  PiratesGame
//
//  Created by Jash Jacob on 06/09/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJCharacter.h"
#import "JJBoss.h"

@interface JJFactory : NSObject

-(NSArray *) tiles;
-(JJCharacter *) character;
-(JJBoss *)boss;

@end
