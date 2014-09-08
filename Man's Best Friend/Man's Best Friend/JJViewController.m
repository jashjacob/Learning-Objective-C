//
//  JJViewController.m
//  Man's Best Friend
//
//  Created by Jash Jacob on 23/08/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJViewController.h"
#import "JJDog.h"
#import "JJPuppy.h"

//newly created class JJDog is imported

@interface JJViewController ()

@end

@implementation JJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    JJDog *myDog = [[JJDog alloc] init]; //creating a instance of a class
    // *myDog is a object of class JJDog - alloc for allocating memory and init for initilizing the object
    //two method calls are taking place [[ class alloc]init] - this is known as embedded method call
    
    myDog.name = @"Layl";
    myDog.breed = @"St. Bernard";
    myDog.age = 1;
    myDog.image= [UIImage imageNamed:@"dog1.png"];
    
    //imageNamed is a class method - UIImage is a class
    //myDog.image is a UI image object
    
    self.myImageView.image = myDog.image; //myImageView is placed by the UIImage object
    self.nameLabel.text = myDog.name;
    self.breedLabel.text = myDog.breed;
    self.currentIndex = 0;
    
    JJDog *secondDog =[[JJDog alloc]init];
    secondDog.name=@"Mona";
    secondDog.breed=@"Shepered";
    secondDog.image=[UIImage imageNamed:@"dog2.png"];
    
    
    JJDog *thirdDog = [[JJDog alloc]init];
    thirdDog.name=@"Whitewood";
    thirdDog.breed=@"Terrier";
    thirdDog.image=[UIImage imageNamed:@"dog3.png"];
    
    JJDog *fourthDog= [[JJDog alloc]init];
    fourthDog.name = @"Lassie";
    fourthDog.breed=@"Collie";
    fourthDog.image =[UIImage imageNamed:@"dog4.png"];
    
    
    self.myDogs = [[ NSMutableArray alloc]init]; //allocate and initialize space
    //NSMutable array is delcared as a property in the header file so that it is accesible in all methods
    //NSMutable array allows you to add or remove objects dynamically
    
    [self.myDogs addObject:myDog]; //allows to add objects to the container
    [self.myDogs addObject:secondDog];
    [self.myDogs addObject:thirdDog];
    [self.myDogs addObject:fourthDog];
    
    
    /* [myDog bark];
     //method call
     
     //method call with arguments
     [myDog barkNumberOfTimes:7];
     
     NSLog(@"%@",myDog.breed);
     [myDog changeBreedToWereWolf];
     NSLog(@"%@",myDog.breed);
     myDog.breed = @"Lab";
     NSLog(@"%@",myDog.breed);
     
     [self printHelloWorld]; // to call the method declared locally using "Self"
     
     [myDog barkNumberOfTimes:5 loudly:YES]; //method call with multiple arguments
     
     int dogYears = [myDog ageInDogYearsFromAge:myDog.age];
     NSLog(@"%i",dogYears);
     
     */
    
    
    JJPuppy *littlePuppy = [[JJPuppy alloc]init];
    //JJPuppy is inherited from JJDog
    
    [littlePuppy bark]; //bark method is inherited from the base class JJDog
    //bark method is over writen in the JJPuppy.m file
    
    littlePuppy.name = @"Boo";
    littlePuppy.breed = @"Pourtogeese";
    littlePuppy.image = [UIImage imageNamed:@"puppy.png"];
    
    [self.myDogs addObject:littlePuppy]; //adding the create puppy object to the array to be displayed
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)printHelloWorld
{
    NSLog(@"Hello World");
}

- (IBAction)newDogBarButtonItemPressed:(UIBarButtonItem *)sender
{
    int numberOfDogs = [self.myDogs count]; // to store the count of the number of array
    int randomIndex = arc4random() % numberOfDogs; // used to generate a random variable
    
    if(self.currentIndex == randomIndex && self.currentIndex == 0)
    {
        randomIndex++;
    }
    else if(self.currentIndex == randomIndex){
        randomIndex--;
    }
    
    self.currentIndex = randomIndex;
    
    
    JJDog *randomDog = [self.myDogs objectAtIndex:randomIndex];
    
    //    self.myImageView.image = randomDog.image;
    //    self.breedLabel.text = randomDog.breed;
    //    self.nameLabel.text=randomDog.name;
    
    //to load image,breed and name randomly
    
    [UIView transitionWithView:self.view duration:1.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        self.myImageView.image = randomDog.image;
        self.breedLabel.text = randomDog.breed;
        self.nameLabel.text = randomDog.name;
    } completion:^(BOOL finished) {
        
    }];
    
    
    sender.title = @"Another Dog maybe?";
    
}
@end
