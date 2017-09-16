//
//  Player.m
//  TwoPlayerMath
//
//  Created by Jaison Bhatti on 2017-09-12.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _lives = 3;        
    }
    return self;
}

- (NSUInteger) decreaseLife {
    self.lives = self.lives - 1;
    return self.lives;
}

@end
