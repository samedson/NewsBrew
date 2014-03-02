//
//  ViewController.m
//  NewsPractice
//
//  Created by Dylan Hallman on 2/11/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import "PreferencesViewController.h"

@interface PreferencesViewController ()
@property (nonatomic) NSInteger totalSlider;
@property (nonatomic) NSInteger numArticles;
@end



@implementation PreferencesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.totalSlider=0;
    self.numArticles=0;

}

- (void)viewDidAppear:(BOOL)animated {
    UINavigationBar *navBar = self.navigationController.navigationBar;
    [navBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    navBar.shadowImage = [UIImage new];
    navBar.translucent = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sumSliders {
    self.totalSlider = self.USslider.value + self.WorldSlider.value + self.BusinessSlider.value + self.TechSlider.value +self.ScienceSlider.value + self.Sports.value +self.EntertainmentSlider.value + self.HealthSlider.value;
}

- (void)sumArticles {
    self.numArticles = (1+ self.TimeSlider.value*4)/.25;
}



- (IBAction)brew:(id)sender {
    [self performSegueWithIdentifier:@"ContentSegue" sender:self];
}
@end
