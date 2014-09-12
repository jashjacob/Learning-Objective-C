//
//  JJViewController.h
//  Man's Best Friend
//
//  Created by Jash Jacob on 23/08/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *breedLabel;

@property (strong, nonatomic) NSMutableArray *myDogs;

- (IBAction)newDogBarButtonItemPressed:(UIBarButtonItem *)sender;
@property (nonatomic) int currentIndex; //can be accessed any where in the viewcontroller.m 


@end
