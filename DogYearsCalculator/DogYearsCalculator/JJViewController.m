//
//  JJViewController.m
//  DogYearsCalculator
//
//  Created by Jash Jacob on 23/08/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJViewController.h"

@interface JJViewController ()

@end

@implementation JJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateAge:(id)sender
{
    float humanAge = [self.inputTextLabel.text floatValue];
    //text property returns string, converting string to float using floatValue method

    float dogYears = humanAge / 7;
    self.textLabel.text = [NSString stringWithFormat:@"%f",dogYears];
    
    //updating the label with float value (converting into float to string using stringWithFormat)
    
}
@end
