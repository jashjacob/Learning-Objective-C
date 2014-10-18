//
//  main.m
//  IntrestingNames
//
//  Created by Jash Jacob on 18/10/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Reading a file
        NSString *nameString =
        [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                  encoding:NSUTF8StringEncoding
                                     error:NULL];
        
        NSString *wordString =
        [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                  encoding:NSUTF8StringEncoding
                                     error:NULL];
        
        
        // Break into an array of strings
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        NSArray *words = [wordString componentsSeparatedByString:@"\n"];
        
        //Array to store the results
        NSMutableArray *results = [NSMutableArray array];
        
        //Printing the count of the names and words
        NSLog(@"Total names = %lu",[names count]);
        NSLog(@"Total words = %lu",[words count]);
        
        
        for (NSString *w in words)
        {
        
            for (NSString *n in names) {
                
                if (w.length == n.length)
                {
                    NSRange re1 = [w rangeOfString:n];
                    
                    if(re1.location == NSNotFound)
                    {
                        NSRange re =[w rangeOfString:n options:NSCaseInsensitiveSearch];
                        
                        if (re.location!= NSNotFound)
                        {
                            NSLog(@"Names = %@ words = %@",n,w);
                            [results addObject:w];
                        }
                    }
                }
            }
        }
        
        NSLog(@"The total number of intresting names = %lu",[results count]);
        
    }
    return 0;
}

