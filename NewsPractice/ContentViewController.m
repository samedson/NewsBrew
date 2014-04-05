//
//  ContentViewController.m
//  NewsBrew
//
//  Created by Samuel Edson on 3/1/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import "ContentViewController.h"

NSString *kUSURL = @"https://news.google.com/news/feeds?pz=1&cf=all&ned=us&hl=en&topic=n&output=rss";
NSString *kWorldURL = @"http://news.google.com/news?pz=1&cf=all&ned=us&hl=en&topic=w&output=rss";
NSString *kBusinessURL = @"https://news.google.com/news/feeds?pz=1&cf=all&ned=us&hl=en&topic=b&output=rss";
NSString *kTechnologyURL = @"http://news.google.com/news?pz=1&cf=all&ned=us&hl=en&topic=tc&output=rss";
NSString *kScienceURL = @"https://news.google.com/news/feeds?pz=1&cf=all&ned=us&hl=en&topic=snc&output=rss";
NSString *kSportsURL = @"https://news.google.com/news/feeds?pz=1&cf=all&ned=us&hl=en&topic=s&output=rss";
NSString *kEntertainmentURL = @"https://news.google.com/news/feeds?pz=1&cf=all&ned=us&hl=en&topic=e&output=rss";
NSString *kHealthURL = @"https://news.google.com/news/feeds?pz=1&cf=all&ned=us&hl=en&topic=m&output=rss";


@implementation ContentViewController

- (void)viewDidLoad {
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    NSArray *topicURLs = @[[NSURL URLWithString:kUSURL],
                           [NSURL URLWithString:kWorldURL],
                           [NSURL URLWithString:kBusinessURL],
                           [NSURL URLWithString:kTechnologyURL],
                           [NSURL URLWithString:kScienceURL],
                           [NSURL URLWithString:kSportsURL],
                           [NSURL URLWithString:kEntertainmentURL],
                           [NSURL URLWithString:kHealthURL]
                           ];
    
    self.contentGenerator = [[NBContentGenerator alloc]
                                initWithRSSURLs:topicURLs
                                    preferences:self.preferences];
    
    [self.contentGenerator beginWhenParsingFinishes];
    
    self.articles = [[NSArray alloc] initWithArray:self.contentGenerator.articles];
    
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

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath {
    
    MWFeedItem *article = self.articles[indexPath.row];

    ArticleViewController *viewControllerB = [[ArticleViewController alloc] initWithNibName:@"ArticleViewController" bundle:nil];
    
    viewControllerB.article = article;
    
    [self.navigationController pushViewController:viewControllerB animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.articles.count;
}


- (NBTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NBTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NBTableViewCell"forIndexPath:indexPath];
    
    MWFeedItem *article = self.articles[indexPath.row];
    
    [cell.titleLabel setText:article.title];
    [cell.summaryLabel setText:article.summary];

    switch ([article.identifier intValue]) {
        case 0:
            cell.topicLabel.text = @"U.S.";
            break;
        case 1:
            cell.topicLabel.text = @"World";
            break;
        case 2:
            cell.topicLabel.text = @"Business";
            break;
        case 3:
            cell.topicLabel.text = @"Technology";
            break;
        case 4:
            cell.topicLabel.text = @"Science";
            break;
        case 5:
            cell.topicLabel.text = @"Sports";
            break;
        case 6:
            cell.topicLabel.text = @"Entertainment";
            break;
        case 7:
            cell.topicLabel.text = @"Health";
            break;
        default:
            break;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM d, yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:article.date];
    [cell.dateLabel setText:stringFromDate];

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}




@end
