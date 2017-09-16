//
//  GameModel.h
//  TwoPlayerMath
//
//  Created by Jaison Bhatti on 2017-09-12.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "QuestionManager.h"

@interface GameModel : NSObject

@property (nonatomic, strong) Player *score;

-(BOOL)gameOver:(Player *)playerScore;

@end
