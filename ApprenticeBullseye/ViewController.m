//
//  ViewController.m
//  ApprenticeBullseye
//
//  Created by paul on 01/10/2014.
//  Copyright (c) 2014 paulcarvill. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int _myTarget;
int _round;
int _myScore;

- (void)viewDidLoad {
    [super viewDidLoad];

    _round = 1;
    _myScore = 0;
    
    [self newGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showAlert {
    UIAlertView *alertView = [[UIAlertView  alloc]
                              initWithTitle:@"YO!"
                              message:[NSString stringWithFormat:@"The target value is: %d\nYou moved the slider to: %ld", _myTarget, lroundf(self.slider.value)]
                              delegate:self
                              cancelButtonTitle:@"cancel this shiz"
                              otherButtonTitles:nil
                              ];
    [alertView  show];
}

- (void)newGame {
    _myTarget = 1 + arc4random_uniform(100);
    self.score.text = [NSString stringWithFormat:@"%d", _myScore];
    self.target.text = [NSString stringWithFormat:@"%d", _myTarget];
    self.rounds.text = [NSString stringWithFormat:@"%d", _round++];
    self.slider.value = 50;
}

- (void)reset {
    _myScore = 0;
    _round = 1;
    [self newGame];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // check if they have scored by matching value with target
    if (lroundf(self.slider.value) == _myTarget) {
        _myScore++;
    }
    [self newGame];
}

@end
