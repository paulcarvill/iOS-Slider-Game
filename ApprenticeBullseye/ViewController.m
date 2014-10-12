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
int _currentValue;

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    
    UIImage *trackLeftImage = [[UIImage imageNamed:@"SliderTrackLeft"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    
    UIImage *trackRightImage = [[UIImage imageNamed:@"SliderTrackRight"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];

    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
    
    
    _round = 1;
    _myScore = 0;
    _currentValue = 50;
    [self newGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)calculateScore {
    // calculate score
    int difference;
    
    difference = (_myTarget - _currentValue);
    if (difference < 0) {
        difference = difference * -1;
    }
    
    _myScore += (100 - difference);
    return difference;
}

- (void)showAlert {
    int difference = [self calculateScore];
    NSString *title;
    
    if (difference == 0) {
        title = @"Amazing! Spot on!";
    } else if (difference < 20) {
        title = @"Not bad!";
    } else {
        title = @"Rubbish!";
    }
    
    UIAlertView *alertView = [[UIAlertView  alloc]
                              initWithTitle:title
                              message:[NSString stringWithFormat:@"The target value is: %d\nYou moved the slider to: %d", _myTarget, _currentValue]
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
    self.slider.value = _currentValue;
}

- (void)reset {
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionFade;
    transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    _myScore = 0;
    _round = 1;
    _currentValue = 50;
    [self newGame];
    [self.view.layer addAnimation:transition forKey:nil];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    [self newGame];
}

- (void)sliderMoved:(UISlider *)slider {
    _currentValue = lroundf(self.slider.value);
}

@end
