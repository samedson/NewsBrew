//
//  NBContentGenerator.m
//  NewsBrew
//
//  Created by Samuel Edson on 3/1/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import "NBContentGenerator.h"

#include <stdlib.h>

@implementation NBContentGenerator

- (id)initWithRSSURLs:(NSArray *)RSSURLs preferences:(NSArray *)preferences {
    if (self = [super init]) {
        self.preferences = preferences;
        self.articles = [[NSMutableArray alloc] init];
        
        self.USParser = [[NBParser alloc] initWithURL:RSSURLs[0]];
        self.WorldParser = [[NBParser alloc] initWithURL:RSSURLs[1]];
        self.BusinessParser = [[NBParser alloc] initWithURL:RSSURLs[2]];
        self.TechParser = [[NBParser alloc] initWithURL:RSSURLs[3]];
        self.ScienceParser = [[NBParser alloc] initWithURL:RSSURLs[4]];
        self.SportsParser = [[NBParser alloc] initWithURL:RSSURLs[5]];
        self.EntertainmentParser = [[NBParser alloc] initWithURL:RSSURLs[6]];
        self.HealthParser = [[NBParser alloc] initWithURL:RSSURLs[7]];
        
        self.parsers = @[
                         self.USParser,
                         self.WorldParser,
                         self.BusinessParser,
                         self.TechParser,
                         self.ScienceParser,
                         self.SportsParser,
                         self.EntertainmentParser,
                         self.HealthParser
                         ];
        
        for (NBParser *parser in self.parsers) {
            [parser start];
        }
    }
    return self;
}


- (void)beginWhenParsingFinishes {
    while ( ! [self parsingIsFinished]) {
        [self performSelector:nil withObject:self afterDelay:0.1 ];
    }

    for (int i = 0; i < self.parsers.count; i++) {
        for (int ii = 0; ii < ((NSNumber *)self.preferences[i]).integerValue; ii++) {
            for (MWFeedItem *item in ((NBParser *)self.parsers[i]).articles) {
                item.identifier = [NSString stringWithFormat:@"%i", i];
                [self.articles addObject:item];
            }
        }
    }
    
    NSMutableArray *articlesReordered = [[NSMutableArray alloc] init];
    while (self.articles.count != 0) {
        int k = arc4random() % self.articles.count;
        [articlesReordered addObject:self.articles[k]];
        [self.articles removeObjectAtIndex:k];
    }
    
    self.articles = articlesReordered;
    
    NSLog(@" * Total number of articles %lu", (unsigned long)self.articles.count);
}

- (BOOL)parsingIsFinished {
    for (NBParser *parser in self.parsers) {
        if ( ! parser.isDone) {
            return NO;
        }
    }
    return YES;
}






@end



