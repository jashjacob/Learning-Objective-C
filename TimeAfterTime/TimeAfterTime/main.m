//
//  main.m
//  TimeAfterTime
//
//  Created by Jash Jacob on 28/09/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate *now = [[NSDate alloc]init];
        
        NSLog(@"This date now is stored at this place %p",now);
        NSLog(@"The date is now %@",now);
        
        double seconds = [now timeIntervalSince1970];
        
        NSLog(@"So the time interval since 1970 is %1f", seconds);
        
        NSDate *later = [now dateByAddingTimeInterval:10000];
        
        NSLog(@"In hundred thousand seconds it will be %@", later);
        
        NSCalendar *cale = [NSCalendar currentCalendar];
        
        NSLog(@"THIS IS THE CALENDAR BEING USED %@", [cale calendarIdentifier]);
        NSLog(@"Lets check the cardinalty and stuff shall we?");
        
        unsigned long dayz = [cale ordinalityOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:now];
        NSLog(@"OMG OMG OMG ! Its just this %lu" ,dayz);
        
        
        
    }
    return 0;
}

