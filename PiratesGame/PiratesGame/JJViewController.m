//
//  JJViewController.m
//  PiratesGame
//
//  Created by Jash Jacob on 06/09/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJViewController.h"
#import "JJFactory.h"
#import "JJTile.h"

@interface JJViewController ()

@end

@implementation JJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    JJFactory *factory = [[JJFactory alloc] init];
    self.tiles = [factory tiles];  //tiles is created in the .h files so that its accessible everywhere
    self.character = [factory character]; // factory character returns the character set for the first time
    self.boss = [factory boss];
    self.currentPoint = CGPointMake(0,0);
    [self updateCharacterStatsForArmor:nil withWeapons:nil withHealtheffect:0];
    [self updateTile];
    [self updateButtons];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender {
    JJTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    if(tile.healthEffect == -15)
    {
        self.boss.health = self.boss.health - self.character.damage;
    }
    
    [self updateCharacterStatsForArmor:tile.armor withWeapons:tile.weapon withHealtheffect:tile.healthEffect];
    [self updateTile];
    
    if(self.character.health <=0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died! Please restart the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
        
    }else if(self.boss.health <=0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory Message" message:@"You have defeated the boss!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alertView show];
    }

}

- (IBAction)northButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    [self updateButtons]; // to hide or unhide the buttons with the possible movements
    [self updateTile]; // to update the tileModel with the story of the respective tile
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender {
    
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}


#pragma mark - Helper Methods
-(void)updateTile
{
    JJTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health]; //to display the integer in a text label
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    
}

-(void)updateButtons
{
    self.westButton.hidden = [self tileExsistAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExsistAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExsistAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExsistAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

-(BOOL)tileExsistAtPoint:(CGPoint)point
{
    if(point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count])
    {
        return NO;
    }
    else
    {
        return YES;
    }

}

-(void)updateCharacterStatsForArmor:(JJArmor *)armor withWeapons:(JJWeapon *)weapon withHealtheffect:(int)healthEffect
{
    if(armor != nil){
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if(weapon !=nil){
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if(healthEffect !=0)
    {
        self.character.health = self.character.health + healthEffect;
    }
    else{
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
    
}

@end
