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

@property (nonatomic) NSInteger numUS;
@property (nonatomic) NSInteger numWorld;
@property (nonatomic) NSInteger numBusiness;
@property (nonatomic) NSInteger numTech;
@property (nonatomic) NSInteger numScience;
@property (nonatomic) NSInteger numSports;
@property (nonatomic) NSInteger numEntertainment;
@property (nonatomic) NSInteger numHealth;

@end

#define IS_WIDESCREEN ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@implementation PreferencesViewController
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
  
  self.USslider.maximumTrackTintColor = [UIColor colorWithRed:153/255.0 green:102/255.0 blue:51/255.0 alpha:1.0];
  self.WorldSlider.maximumTrackTintColor = [UIColor colorWithRed:153/255.0 green:102/255.0 blue:51/255.0 alpha:1.0];
  self.BusinessSlider.maximumTrackTintColor = [UIColor colorWithRed:153/255.0 green:102/255.0 blue:51/255.0 alpha:1.0];
  self.TechSlider.maximumTrackTintColor = [UIColor colorWithRed:153/255.0 green:102/255.0 blue:51/255.0 alpha:1.0];
  self.Sports.maximumTrackTintColor = [UIColor colorWithRed:153/255.0 green:102/255.0 blue:51/255.0 alpha:1.0];
  self.EntertainmentSlider.maximumTrackTintColor = [UIColor colorWithRed:153/255.0 green:102/255.0 blue:51/255.0 alpha:1.0];
  self.HealthSlider.maximumTrackTintColor = [UIColor colorWithRed:153/255.0 green:102/255.0 blue:51/255.0 alpha:1.0];
  self.ScienceSlider.maximumTrackTintColor = [UIColor colorWithRed:153/255.0 green:102/255.0 blue:51/255.0 alpha:1.0];
  
  NSArray *sliders = @[self.USslider, self.WorldSlider, self.BusinessSlider, self.TechSlider, self.Sports, self.EntertainmentSlider, self.HealthSlider, self.ScienceSlider];
  
  if ( ! (IS_WIDESCREEN)) {
    CGRect frame;
//    for (int i = 0; i < 8; i++) {
//      NSLog(@"frams");
//      frame = ((UISlider *)sliders[i]).frame;
//      NSLog(@"%f", frame.origin.y);
//      frame.origin.y -= 10 * i;
//      NSLog(@"%f", frame.origin.y);
//      ((UISlider *)sliders[i]).frame = frame;
//      NSLog(@"%f", ((UISlider *)sliders[i]).frame.origin.y);
//    }
    self.EntertainmentSlider.hidden = YES;
    self.HealthSlider.hidden = YES;
    //self.Sports.hidden = YES;
    
    self.entertainmentLabel.hidden = YES;
    self.healthLabel.hidden = YES;
    //self.sportsLabel.hidden = YES;
    
    frame = _brewButton.frame;
    frame.origin.y = 100;
    [_brewButton setFrame:frame];
  }
  
  UIButton *brewButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 280, 100, 300)];
  [brewButton addTarget:self action:@selector(brew:) forControlEvents:UIControlEventTouchUpInside];
  [brewButton setTitle:@"Brew" forState:UIControlStateNormal];
  [brewButton.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
  [self.view addSubview:brewButton];
  
  NSLog(@"%f", ((UISlider *)sliders[7]).frame.origin.y);
  
  _activity_background = [[UIView alloc] init];
  _activity_background.frame = CGRectMake(0, 0, 50, 50);
  _activity_background.center = self.view.center;
  _activity_background.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
  _activity_background.layer.cornerRadius = 5;
  _activity_background.layer.masksToBounds = YES;
  
  _activityView = [[UIActivityIndicatorView alloc]     initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
  _activityView.center = self.view.center;
  
  [self.view addSubview:_activity_background];
  [self.view addSubview:_activityView];
}

- (void)viewDidAppear:(BOOL)animated {
    UINavigationBar *navBar = self.navigationController.navigationBar;
    [navBar setBackgroundImage:[UIImage new]
                 forBarMetrics:UIBarMetricsDefault];
    navBar.shadowImage = [UIImage new];
    navBar.translucent = YES;
    navBar.backgroundColor = [UIColor clearColor];
  
    [_activity_background setBackgroundColor:[UIColor clearColor]];
    [_activityView stopAnimating];
  
    [self sumSliders];
    [self sumArticles];
    [self setNums];

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
    
    NSLog(@"Number of Total Stories %ld", (long)self.numArticles);

}

- (IBAction)brew:(id)sender {
    [self performSelectorInBackground:@selector(showActivityIndicator) withObject:nil];
    [self performSegueWithIdentifier:@"ContentSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"ContentSegue"]){
        ContentViewController *controller = (ContentViewController *)segue.destinationViewController;
        controller.preferences = @[
                                   [NSNumber numberWithInteger:_numUS],
                                   [NSNumber numberWithInteger:_numWorld],
                                   [NSNumber numberWithInteger:_numBusiness],
                                   [NSNumber numberWithInteger:_numTech],
                                   [NSNumber numberWithInteger:_numScience],
                                   [NSNumber numberWithInteger:_numSports],
                                   [NSNumber numberWithInteger:_numEntertainment],
                                   [NSNumber numberWithInteger:_numHealth],
                                   [NSNumber numberWithInteger:_numArticles]
                                   ];
    }
}

- (void)showActivityIndicator {
  _activity_background.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
  [_activityView startAnimating];
}

@end
