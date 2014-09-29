//
//  AwesomeWorldViewController.m
//  Awesome World
//
//  Created by Jash Jacob on 28/09/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "AwesomeWorldViewController.h"

@interface AwesomeWorldViewController ()

@end

@implementation AwesomeWorldViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    NSString *planet1 = @"Mercury";
    NSString *planet2= @"Venus";
    NSString *planet3= @"Earth";
    NSString *planet4= @"Mars";
    NSString *planet5= @"Jupiter";
    NSString *planet6= @"Saturn";
    NSString *planet7= @"Uranus";
    NSString *planet8= @"Neptune";
    
    self.planets = [[NSMutableArray alloc]initWithObjects:planet1,planet2,planet3,planet4,planet5,planet6,planet7,planet8, nil];
    
    NSMutableDictionary *myDictonary = [[NSMutableDictionary alloc]init];
    
    NSString *firstColor = @"red";
    
    [myDictonary setObject:firstColor forKey:@"FireTruck Color"]; //setting object using for the key "FireTruck Color"
    [myDictonary setObject:@"blue" forKey:@"Ocean Color"];
    [myDictonary setObject:@"Yellow" forKey:@"Star Color"];
    
    NSLog(@"%@", myDictonary);
    
    NSString *blueString = [myDictonary objectForKey:@"Ocean Color"]; // will return the object keyname
    NSLog(@"%@", blueString);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.planets count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [self.planets objectAtIndex:indexPath.row];
    
    //[NSString stringWithFormat:@"Section %i Row %i",indexPath.section,indexPath.row];
    
    if(indexPath.section==0)
    {
        cell.backgroundColor=[UIColor redColor];
    }
    else{
        cell.backgroundColor=[UIColor blueColor];
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
