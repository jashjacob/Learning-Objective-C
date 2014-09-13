//
//  JJFactory.m
//  PiratesGame
//
//  Created by Jash Jacob on 06/09/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJFactory.h"
#import "JJTile.h"

@implementation JJFactory

-(NSArray *) tiles{
    
    JJTile *tile1 = [[JJTile alloc]init];
    tile1.story = @"Captain, We need you to defeat the evil pirate boss. Would you like a metallic sword to get started ?";
    tile1.backgroundImage= [UIImage imageNamed:@"PirateStart.jpg"];
    
    JJWeapon *bluntedSword = [[JJWeapon alloc]init];
    bluntedSword.name = @"Mettalic Sword";
    bluntedSword.damage = 18;
    tile1.weapon = bluntedSword;
    tile1.actionButtonName = @"Take Sword!";
    
    JJTile *tile2 = [[JJTile alloc]init];
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor to Steel armor ?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    
    JJArmor *steelArmor = [[JJArmor alloc]init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 25;
    tile2.armor = steelArmor;
    tile2.actionButtonName = @"Take Armor!";
    
    JJTile *tile3 = [[JJTile alloc]init];
    tile3.story = @"A mysterious dock appears in the horizon. Should we stop and ask for directions ?";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile3.healthEffect = 12;
    tile3.actionButtonName = @"Stop at the dock";
    
    NSMutableArray *firstColumn = [[NSMutableArray alloc]init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    JJTile *tile4 = [[JJTile alloc]init];
    tile4.story = @"You have found a parrot. This could be used in your armor slot. Parrots are a great defender.";
    tile4.backgroundImage =[UIImage imageNamed:@"PirateParrot.jpg"];
    JJArmor *parrotArmor = [[JJArmor alloc]init];
    parrotArmor.health = 20;
    parrotArmor.name =@"Parrot";
    tile4.armor = parrotArmor;
    tile4.actionButtonName = @"Adopt Parrot";
    
    JJTile *tile5 = [[JJTile alloc]init];
    tile5.story = @" You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol ?";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    JJWeapon *pistolWeapon = [[JJWeapon alloc]init];
    pistolWeapon.name=@"Pistol";
    pistolWeapon.damage=17;
    tile5.weapon = pistolWeapon;
    tile5.actionButtonName = @"Use Pistol";
    
    
    JJTile *tile6 = [[JJTile alloc]init];
    tile6.story = @"You have been captured by the pirates and ordered to walk the plank.";
    tile6.backgroundImage =[UIImage imageNamed:@"PiratePlank.jpg"];
    tile6.healthEffect = -23;
    tile6.actionButtonName = @"Show no fear!!";
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc] initWithObjects:tile4,tile5,tile6, nil];
    
    JJTile *tile7 = [[JJTile alloc]init];
    tile7.story = @"You have sighted a pirate battle off the coast. Should we intervene? ";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile7.healthEffect = 8;
    tile7.actionButtonName = @"Fight those scums!!";
    
    JJTile *tile8 = [[JJTile alloc]init];
    tile8.story = @"The legends of the deep, Mighty Kraken appears!!";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile8.healthEffect = -48;
    tile8.actionButtonName = @"Abandon Ship!";
    
    
    JJTile *tile9 = [[JJTile alloc]init];
    tile9.story = @"You've stumbled upon a pirate treasure.";
    tile9.backgroundImage =[UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile9.healthEffect = 10;
    tile9.actionButtonName = @"Take Treasure!";
    
    NSMutableArray *thirdCoulmn =[[NSMutableArray alloc] initWithObjects:tile7,tile8,tile9, nil];
    
    JJTile *tile10 = [[JJTile alloc]init];
    tile10.story = @"A group of pirates attempt to board your ship. Fight back?";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile10.healthEffect = -5;
    tile10.actionButtonName = @"Repel the invaders!";
    
    JJTile *tile11 = [[JJTile alloc]init];
    tile11.story = @"In the deep sea, many things live. Will the fortune help or ruin?";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.healthEffect = -7 ;
    tile11.actionButtonName = @"Swin Deeper..";
    
    JJTile *tile12 = [[JJTile alloc]init];
    tile12.story = @"The Pirate boss has arrived! Defeat him!";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.healthEffect = -15;
    tile12.actionButtonName = @"Fight!";
    
    NSMutableArray *fourthCoulmn =[[NSMutableArray alloc] initWithObjects:tile10,tile11,tile12, nil];
    NSArray *tiles = [[NSArray alloc] initWithObjects:firstColumn,secondColumn,thirdCoulmn,fourthCoulmn, nil];
    
    return tiles;
}

-(JJCharacter *)character
{
    JJCharacter *character = [[JJCharacter alloc]init];
    character.health = 100;
    JJArmor *armor = [[JJArmor alloc]init];
    armor.name =@"Cloak";
    armor.health= 5;
    character.armor = armor;
    JJWeapon *weapon = [[JJWeapon alloc]init];
    weapon.name = @"Fists";
    weapon.damage = 10;
    character.weapon = weapon;

    return character;
}

-(JJBoss *)boss{
    JJBoss *boss =[[JJBoss alloc] init];
    boss.health  = 70;
    return boss;
}

@end
