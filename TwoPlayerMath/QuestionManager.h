//
//  QuestionManager.h
//  TwoPlayerMath
//
//  Created by Jaison Bhatti on 2017-09-12.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionManager : NSObject

@property (nonatomic, copy) NSString *question;
@property (nonatomic) NSInteger answer;


@property (nonatomic) NSInteger rightValue;
@property (nonatomic) NSInteger leftValue;

- (NSString *) genQuestion;


@end
