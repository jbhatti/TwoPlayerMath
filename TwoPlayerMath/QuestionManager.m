//
//  QuestionManager.m
//  TwoPlayerMath
//
//  Created by Jaison Bhatti on 2017-09-12.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "QuestionManager.h"

@implementation QuestionManager

- (instancetype)init {
    self = [super init];
    if (self) {        

        
        
        
        
    }
    return self;
}

- (NSInteger)answer {
    return _answer;
}

- (NSString *) genQuestion {
    _rightValue = arc4random_uniform(9) + 10;
    _leftValue = arc4random_uniform(9) + 10;
    
    NSString * generateQuestion = [NSString stringWithFormat:@"What is %li + %li ?", (long)self.leftValue, (long)self.rightValue];
    
    
    _question = generateQuestion;
    
    _answer = (_leftValue + _rightValue);
    
    return self.question;
    
}


@end
