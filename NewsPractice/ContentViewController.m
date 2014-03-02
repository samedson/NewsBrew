//
//  ContentViewController.m
//  NewsBrew
//
//  Created by Samuel Edson on 3/1/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import "ContentViewController.h"

@implementation ContentViewController

- (void)viewDidLoad {
    self.articles = [[NSArray alloc] initWithObjects:@"poop", nil];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    UINavigationBar *navBar = self.navigationController.navigationBar;
    
    UIColor *color = [UIColor whiteColor];
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [navBar setBackgroundImage:image
                 forBarMetrics:UIBarMetricsDefault];
    navBar.shadowImage = [UIImage new];
    
    [self.navigationController.navigationBar setTranslucent:YES];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}


- (NBTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NBTableViewCell"forIndexPath:indexPath];
    
    [cell.titleLabel setText:self.articles[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

}



@end
