//
//  ViewController.m
//  NewsPractice
//
//  Created by Dylan Hallman on 2/11/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) NSInteger totalSlider;
@property (nonatomic) NSInteger numArticles;
@property (nonatomic) NSInteger numUS;
@property (nonatomic) NSInteger numWorld;
@property (nonatomic) NSInteger numBusiness;
@property (nonatomic) NSInteger numTech;
@property (nonatomic) NSInteger numScience;
@property (nonatomic) NSInteger numSports;
@property (nonatomic) NSInteger numEntertainment;
@property (nonatomic) NSInteger numHealth;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.totalSlider=0;
    self.numArticles=0;
    self.numUS=0;
    self.numWorld=0;
    self.numBusiness=0;
    self.numTech=0;
    self.numScience=0;
    self.numSports=0;
    self.numEntertainment=0;
    self.numHealth=0;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sumSliders
{
    self.totalSlider = self.USslider.value + self.WorldSlider.value + self.BusinessSlider.value + self.TechSlider.value +self.ScienceSlider.value + self.Sports.value +self.EntertainmentSlider.value + self.HealthSlider.value;
}

- (void)sumArticles
{
    self.numArticles = 1 + ( (1+ self.TimeSlider.value*4) / .5);
}

- (void)setNums
{
    self.numUS = round (self.numArticles * self.USslider.value / (self.totalSlider + 0.0));
    
    self.numWorld = round (self.numArticles * self.WorldSlider.value / (self.totalSlider + 0.0));
    
    self.numBusiness = round (self.numArticles * self.BusinessSlider.value / (self.totalSlider + 0.0));
    
    self.numTech = round (self.numArticles * self.TechSlider.value / (self.totalSlider + 0.0));
    
    self.numScience = round (self.numArticles * self.ScienceSlider.value / (self.totalSlider + 0.0));
    
    self.numSports = round (self.numArticles * self.Sports.value / (self.totalSlider + 0.0));
    
    self.numEntertainment = round (self.numArticles * self.EntertainmentSlider.value / (self.totalSlider + 0.0));
    
    self.numHealth = round (self.numArticles * self.HealthSlider.value / (self.totalSlider + 0.0));
    /*
     if (self.numEntertainment+self.numBusiness+self.numHealth+self.numScience+self.numSports+self.numTech+self.numUS+self.numWorld > self.numArticles) {
     //TBD
     }
     if (self.numEntertainment+self.numBusiness+self.numHealth+self.numScience+self.numSports+self.numTech+self.numUS+self.numWorld < self.numArticles) {
     //TBD
     }*/
}


- (IBAction)sliderChanged:(id)sender {
    [self sumSliders];
    [self sumArticles];
    [self setNums];
    
    
    
    NSLog(@"Number of US Politics Stories %ld", (long)self.numUS);
    NSLog(@"Number of World Politics Stories %ld", (long)self.numWorld);
    NSLog(@"Number of Business Stories %ld", (long)self.numBusiness);
    NSLog(@"Number of Tech Stories %ld", (long)self.numTech);
    NSLog(@"Number of Science Stories %ld", (long)self.numScience);
    NSLog(@"Number of Sports Stories %ld", (long)self.numSports);
    NSLog(@"Number of Entertainment Stories %ld", (long)self.numEntertainment);
    NSLog(@"Number of Health Stories %ld", (long)self.numHealth);
    
}
@end
