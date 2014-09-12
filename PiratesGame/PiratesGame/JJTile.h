//
//  JJTile.h
//  PiratesGame
//
//  Created by Jash Jacob on 06/09/14.
//  Copyright (c) 2014 Techzei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJTile : NSObject

@property (strong,nonatomic) NSString *story; //will contain the story that updates the storyLabel
@property (strong,nonatomic) UIImage *backgroundImage; //each tile will have a separate background
@property (strong,nonatomic) NSString *actionButtonName; //to update the action button title over each tile view


@end
