//
//  ViewController.m
//  TwoPlayerMath
//
//  Created by Jaison Bhatti on 2017-09-12.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"
#import "GameModel.h"
#import "QuestionManager.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayQuestion;
@property (weak, nonatomic) IBOutlet UILabel *userInput;
@property (weak, nonatomic) IBOutlet UILabel *playerOneScore;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScore;
@property (nonatomic, strong) QuestionManager* manager;
@property (nonatomic, strong) GameModel *gameModel;
@property (nonatomic, strong) Player * playerOne;
@property (nonatomic, strong) Player * playerTwo;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gameModel = [[GameModel alloc] init];

    self.playerOne = [[Player alloc] init];
    self.playerOne.turn = YES;
    self.playerTwo = [[Player alloc] init];
    self.playerTwo.turn = NO;
    
    self.manager = [[QuestionManager alloc] init];
    self.displayQuestion.text = self.manager.genQuestion;
    [self.displayQuestion sizeToFit];
    
    self.playerOneScore.text = [NSString stringWithFormat:@"Player 1 Lives: %lu", (unsigned long)self.playerOne.lives];
    [self.playerOneScore sizeToFit];
    
    self.playerTwoScore.text = [NSString stringWithFormat:@"Player 2 Lives: %lu", (unsigned long)self.playerTwo.lives];
    [self.playerTwoScore sizeToFit];
}


- (IBAction)numberTouched:(UIButton *)sender {
    self.userInput.text = [self.userInput.text stringByAppendingString:[NSString stringWithFormat:@"%li", sender.tag]];
}

- (IBAction)updatePlayerScore:(id)sender {
    if (self.playerOne.turn == YES) {
        if ([self.userInput.text intValue] == self.manager.answer) {
            self.userInput.text = @"Correct!";
        } else {
            self.playerOneScore.text = [NSString stringWithFormat:@"Player 1 Lives: %lu", (unsigned long)[self.playerOne decreaseLife]];
            self.userInput.text = @"Wrong!";
        }
        int64_t delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            self.userInput.text = @"";});
        self.displayQuestion.text = @"";
        self.displayQuestion.text = [self.manager genQuestion];
        [self.displayQuestion sizeToFit];
        self.playerOne.turn = NO;
        self.playerTwo.turn = YES;
        if ([self.gameModel gameOver:self.playerOne]) {
            self.displayQuestion.text = @"Game Over! Player 2 Wins!";
            [self.displayQuestion sizeToFit];
        }
    } else {
            if ([self.userInput.text intValue] == self.manager.answer) {
                self.userInput.text = @"Correct!";
            } else {
                self.playerTwoScore.text = [NSString stringWithFormat:@"Player 2 Lives: %lu", (unsigned long)[self.playerTwo decreaseLife]];
                self.userInput.text = @"Wrong!";
            }
        int64_t delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            self.userInput.text = @"";});
        self.displayQuestion.text = [self.manager genQuestion];
        [self.displayQuestion sizeToFit];
        self.playerTwo.turn = NO;
        self.playerOne.turn = YES;
        if ([self.gameModel gameOver:self.playerTwo]) {
            self.displayQuestion.text = @"Game Over! Player 1 Wins!";
            [self.displayQuestion sizeToFit];
        }
        
        }
}
    
     
    
    




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
