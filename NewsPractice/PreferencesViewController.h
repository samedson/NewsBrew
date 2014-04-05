//
//  ViewController.h
//  NewsPractice
//
//  Created by Dylan Hallman on 2/11/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ContentViewController.h"

@interface PreferencesViewController : UIViewController
- (IBAction)sliderChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *USslider;
@property (weak, nonatomic) IBOutlet UISlider *WorldSlider;
@property (weak, nonatomic) IBOutlet UISlider *BusinessSlider;
@property (weak, nonatomic) IBOutlet UISlider *TechSlider;
@property (weak, nonatomic) IBOutlet UISlider *ScienceSlider;
@property (weak, nonatomic) IBOutlet UISlider *Sports;
@property (weak, nonatomic) IBOutlet UISlider *EntertainmentSlider;
@property (weak, nonatomic) IBOutlet UISlider *HealthSlider;
@property (weak, nonatomic) IBOutlet UISlider *TimeSlider;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ActivityDial;

- (IBAction)brew:(id)sender;


@end
