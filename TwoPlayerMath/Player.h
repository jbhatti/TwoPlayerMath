//
//  Player.h
//  TwoPlayerMath
//
//  Created by Jaison Bhatti on 2017-09-12.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Player : NSObject

@property (nonatomic, assign) NSUInteger lives;
@property (nonatomic, assign) BOOL turn;
@property (nonatomic, assign) NSUInteger answer;

- (NSUInteger) decreaseLife;

@end
