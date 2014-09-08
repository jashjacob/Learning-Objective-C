//
//  JJDog.m
//  Man's Best Friend
//
//  Created by Jash Jacob on 23/08/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJDog.h"

@implementation JJDog

-(void)bark
{
    NSLog(@"Woof Woof");
}

-(void)barkNumberOfTimes:(int)numberOfTimes
{
    for(int bark=1; bark <= numberOfTimes; bark++)
    {
        [self bark]; //method call with "self" keyword
        //implicit local variables, self can be used to update values in the header file JJDog.h
    }
}

-(void)changeBreedToWereWolf
{
    self.breed = @"Werewolf";
}


//method with multiple arguments
-(void)barkNumberOfTimes:(int)numberOfTimes loudly:(BOOL)isLoud;
{
    if(!isLoud)
    {
        for (int bark=1; bark<=numberOfTimes; bark++) {
            NSLog(@"Yip Yip");
        }
    }
    else
    {
        for (int bark=1; bark<=numberOfTimes; bark++) {
            NSLog(@"Ruff Ruff");
        }
    }
}

-(int)ageInDogYearsFromAge:(int)regularAge
{
    int newAge = regularAge*7;
    return newAge;  // returns calculated human age 
}

@end
