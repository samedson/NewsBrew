//
//  ContentViewController.h
//  NewsBrew
//
//  Created by Samuel Edson on 3/1/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import "NBTableViewCell.h"

#import "MWFeedParser.h"

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MWFeedParserDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *articles;

@property (retain, nonatomic) MWFeedParser *USParser;
@property (retain, nonatomic) MWFeedParser *WorldParser;
@property (retain, nonatomic) MWFeedParser *BusinessParser;
@property (retain, nonatomic) MWFeedParser *TechParser;
@property (retain, nonatomic) MWFeedParser *ScienceParser;
@property (retain, nonatomic) MWFeedParser *SportsParse;
@property (retain, nonatomic) MWFeedParser *EntertainmentParser;
@property (retain, nonatomic) MWFeedParser *HealthParser;
@property (retain, nonatomic) MWFeedParser *TimeParser;

@end
