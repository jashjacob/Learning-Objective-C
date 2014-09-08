//
//  JJDog.h
//  Man's Best Friend
//
//  Created by Jash Jacob on 23/08/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJDog : NSObject
//NSObject class is iherited(:) into JJDog class

//properties are attributes for an object

@property (nonatomic) int age;
// @property is used to add the property to the class JJDog
//int is primitive

@property (nonatomic,strong) NSString *breed;
//NSString is a class used to represnt collection of characters
// * indicates pointers to objects

@property(nonatomic,strong) UIImage *image;
//UIImages is a class used to represent integer

//primitives and objects are stored differently in memory
// strong defines how long the object is kept in memory

@property (nonatomic,strong) NSString *name;


//creating methods
-(void)bark;
-(void)barkNumberOfTimes:(int)numberOfTimes;
//method with parameter int

-(void)changeBreedToWereWolf;

-(void)barkNumberOfTimes:(int)numberOfTimes loudly:(BOOL)isLoud; //method with two arguments

//return type method
-(int)ageInDogYearsFromAge:(int)regularAge;


@end
