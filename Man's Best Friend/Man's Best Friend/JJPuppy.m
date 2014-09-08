//
//  JJPuppy.m
//  Man's Best Friend
//
//  Created by Jash Jacob on 02/09/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJPuppy.h"

@implementation JJPuppy

-(void)givePuppyEyes
{
    NSLog(@":(");
}

-(void)bark{
    
    [super bark]; // calls the method in the super class (base class)
    
    NSLog(@"Whimper Whimper");
    [self givePuppyEyes];
}

@end
