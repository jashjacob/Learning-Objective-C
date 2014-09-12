//
//  JJCharacter.h
//  PiratesGame
//
//  Created by Jash Jacob on 12/09/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJArmor.h"
#import "JJWeapon.h"

@interface JJCharacter : NSObject

@property (strong,nonatomic) JJArmor *armor;
@property (strong,nonatomic) JJWeapon *weapon;

@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
