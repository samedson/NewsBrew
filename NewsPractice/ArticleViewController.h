//
//  ArticleViewController.h
//  NewsBrew
//
//  Created by Samuel Edson on 4/4/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import "MWFeedItem.h"

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) MWFeedItem *article;

@end
