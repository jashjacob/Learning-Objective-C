//
//  JJViewController.h
//  PiratesGame
//
//  Created by Jash Jacob on 06/09/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJCharacter.h"
#import "JJBoss.h"

@interface JJViewController : UIViewController

//iVarables
@property (nonatomic) CGPoint currentPoint;
@property (strong,nonatomic) NSArray *tiles;

@property (strong,nonatomic) JJCharacter *character;
@property (strong,nonatomic) JJBoss *boss;


//IBoutlets
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;

@property (strong, nonatomic) IBOutlet UILabel *storyLabel;

@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;

@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;

//IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;


@end
