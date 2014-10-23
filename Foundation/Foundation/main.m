//
//  main.m
//  Foundation
//
//  Created by Jash Jacob on 22/10/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // insert code here...
        
        NSObject *myFirstObject = [[NSObject alloc]init];
        NSLog(@"Class > %@", [myFirstObject class]);
        NSLog(@"Superclass > %@", [myFirstObject superclass]);
        NSLog(@"Conforms to protocol > %i", [myFirstObject conformsToProtocol:@protocol(NSObject)]);
        
        NSNumber *myNumber = [NSNumber numberWithDouble:854736e+13];
        NSLog(@"Double Value    > %f", [myNumber doubleValue]);
        NSLog(@"Float Value     > %f", [myNumber floatValue]);
        NSLog(@"Int Value       > %i", [myNumber intValue]);
        
        NSString *emoji = @"🌚🌞😋";
        for (int i =0; i<10; i++) {
            for(int j =0; j<=i; j++){
                NSLog(@"%@ ", emoji);
            }
        }
        
        NSString *string1 = @"This is a string literal.";
        NSString *string2 = [[NSString alloc] initWithFormat:@"Strings can be created many ways."];
        
        //NSMutableString *mutableString = [[NSMutableString alloc] initWithString:string1];
        NSMutableString *mutableString = [[NSMutableString alloc]init];
        //[mutableString appendString:string1];
        //[mutableString appendString:string2];
        [mutableString appendFormat:@" %@ %@ %i", string1,string2,[myNumber intValue]];
        NSLog(@"%@", mutableString);
        
        NSArray *myArray = [NSArray arrayWithObjects:@"Bread", @"Butter", @"Milk", @"Eggs", nil];
        NSLog(@"Number of Elements  > %li", [myArray count]);
        NSLog(@"Object at Index 2   > %@", [myArray objectAtIndex:2]);
        NSLog(@"myArray >  %@", myArray);
        
        NSMutableArray *myMutableArray = [NSMutableArray arrayWithObject:[NSNumber numberWithInt:265]];
        [myMutableArray addObject:[NSNumber numberWithInt:45]];
        NSLog(@"Mutable Array       > %@", myMutableArray);
        
        NSString *keyA = @"myKey";
        NSString *keyB = @"myKey";
        NSDictionary *myDictionary = [NSDictionary dictionaryWithObject:@"This is a string literal" forKey:keyA];
        NSLog(@"%@", [myDictionary objectForKey:keyB]);
        
        NSMutableDictionary *myMutableDictionary = [NSMutableDictionary dictionary];
        [myMutableDictionary setObject:myDictionary forKey:@"myDictionary"];
        NSLog(@"%@", myMutableDictionary);
        
        
        //Objective C Litreals for NSNumber, NSArray and NSDictonary - Only possible Xcode 4.5 and above
        NSNumber *oldNumber1 = [NSNumber numberWithBool:YES];
        NSNumber *newNubmer1 = @YES;
        
        NSNumber *oldNumber2 = [NSNumber numberWithInt:2147];
        NSNumber *newNubmer2 = @2147;
        
        NSArray *oldArray = [NSArray arrayWithObjects:@"one", @"two", @"three", nil];
        NSArray *newArray = @[@"one", @"two", @"three"];
        
        NSDictionary *oldDictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:12345] forKey:@"key"];
        NSDictionary *newDictionary = @{@"key": @12345};
        
        
        
    }
    return 0;
}

