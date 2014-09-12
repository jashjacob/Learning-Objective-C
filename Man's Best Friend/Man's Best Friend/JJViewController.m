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
    
    myDog.name = @"Sophie!";
    myDog.caption = @"Adorable Eyes";
    myDog.age = 1;
    myDog.image= [UIImage imageNamed:@"dog-1.png"];
    
    //imageNamed is a class method - UIImage is a class
    //myDog.image is a UI image object
    
    self.myImageView.image = myDog.image; //myImageView is placed by the UIImage object
    self.nameLabel.text = myDog.name;
    self.breedLabel.text = myDog.caption;
    self.currentIndex = 0;
    
    JJDog *secondDog =[[JJDog alloc]init];
   
    secondDog.caption=@"Miss me?";
    secondDog.image=[UIImage imageNamed:@"dog-2.png"];
    
    
    JJDog *thirdDog = [[JJDog alloc]init];
   
    thirdDog.caption=@"DAWWWWWWWWWWW";
    thirdDog.image=[UIImage imageNamed:@"dog-3.png"];
    
    JJDog *fourthDog= [[JJDog alloc]init];
   
    fourthDog.caption=@"So cute!";
    fourthDog.image =[UIImage imageNamed:@"dog-4.png"];
    
    self.myDogs = [[ NSMutableArray alloc]init]; //allocate and initialize space
    //NSMutable array is delcared as a property in the header file so that it is accesible in all methods
    //NSMutable array allows you to add or remove objects dynamically
    
    [self.myDogs addObject:myDog]; //allows to add objects to the container
    [self.myDogs addObject:secondDog];
    [self.myDogs addObject:thirdDog];
    [self.myDogs addObject:fourthDog];
  
    /*
     NSLog(@"%@",myDog.caption);
     [myDog changecaptionToWereWolf];
     NSLog(@"%@",myDog.caption);
     myDog.caption = @"Lab";
     NSLog(@"%@",myDog.caption);
     
     [self printHelloWorld]; // to call the method declared locally using "Self"
     
     [myDog barkNumberOfTimes:5 loudly:YES]; //method call with multiple arguments
     
     int dogYears = [myDog ageInDogYearsFromAge:myDog.age];
     NSLog(@"%i",dogYears);
     
    
    
    [littlePuppy bark]; //bark method is inherited from the base class JJDog
    //bark method is over writen in the JJPuppy.m file
      */
   
    JJPuppy *littlePuppy = [[JJPuppy alloc]init];
    //JJPuppy is inherited from JJDog
    
    littlePuppy.caption = @"^_^";
    littlePuppy.image = [UIImage imageNamed:@"dog-5.png"];
    
    [self.myDogs addObject:littlePuppy]; //adding the create puppy object to the array to be displayed
    
    self.nameLabel.text = myDog.name; // to set the nameLabel to just one name - @"Sophie"!
    
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
    //    self.breedLabel.text = randomDog.caption;
    //    self.nameLabel.text=randomDog.name;
    
    //to load image,caption and name randomly
    
    [UIView transitionWithView:self.view duration:1.2 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        self.myImageView.image = randomDog.image;
        self.breedLabel.text = randomDog.caption;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    sender.title = @"Another cute picture ?";
    
}
@end
