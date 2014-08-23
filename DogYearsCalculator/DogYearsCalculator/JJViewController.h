//
//  JJViewController.h
//  DogYearsCalculator
//
//  Created by Jash Jacob on 23/08/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) IBOutlet UITextField *inputTextLabel;
- (IBAction)calculateAge:(id)sender;

@end
