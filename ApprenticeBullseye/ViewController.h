//
//  ViewController.h
//  ApprenticeBullseye
//
//  Created by paul on 01/10/2014.
//  Copyright (c) 2014 paulcarvill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, weak) IBOutlet UISlider *slider;
@property (nonatomic, weak) IBOutlet UILabel *target;
@property (nonatomic, weak) IBOutlet UILabel *score;
@property (nonatomic, weak) IBOutlet UILabel *rounds;

- (IBAction)showAlert;

- (IBAction)reset;

@end

