//
//  GameModel.m
//  TwoPlayerMath
//
//  Created by Jaison Bhatti on 2017-09-12.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "GameModel.h"


@interface GameModel ()


@end

@implementation GameModel

-(BOOL)gameOver:(Player *)playerScore {
    if (playerScore.lives == 0) {
        return YES;
    } else {
        return NO;
    }
}


@end
