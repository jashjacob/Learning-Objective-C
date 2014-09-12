//
//  JJViewController.m
//  PiratesGame
//
//  Created by Jash Jacob on 06/09/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import "JJViewController.h"
#import "JJFactory.h"
#import "JJTile.h"

@interface JJViewController ()

@end

@implementation JJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    JJFactory *factory = [[JJFactory alloc] init];
    self.tiles = [factory tiles];  //tiles is created in the .h files so that its accessible everywhere
    
    self.currentPoint = CGPointMake(0,0);
    [self updateTile];
    
    [self updateButtons];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    
}

- (IBAction)northButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    [self updateButtons]; // to hide or unhide the buttons with the possible movements
    [self updateTile]; // to update the tileModel with the story of the respective tile
    
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButtons];
    [self updateTile];
    
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

-(void)updateTile
{
    JJTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
}

-(void)updateButtons
{
    self.westButton.hidden = [self tileExsistAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExsistAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExsistAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExsistAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}

-(BOOL)tileExsistAtPoint:(CGPoint)point
{
    if(point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count])
    {
        return NO;
    }else{
        return YES;
    }

}

@end
