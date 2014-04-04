//
//  ContentViewController.h
//  NewsBrew
//
//  Created by Samuel Edson on 3/1/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import "NBContentGenerator.h"
#import "NBTableViewCell.h"
#import "ArticleViewController.h"

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NBContentGenerator *contentGenerator;
@property (strong, nonatomic) NSArray *articles;
@property (strong, nonatomic) NSArray *preferences;

@end
