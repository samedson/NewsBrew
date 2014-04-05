//
//  NBParser.m
//  NewsBrew
//
//  Created by Samuel Edson on 4/4/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import "NBParser.h"

@implementation NBParser

- (id)initWithURL:(NSURL *)url {
    if (self = [super init]) {
        _parser = [[MWFeedParser alloc] initWithFeedURL:url];
        _parser.delegate = self;
        _articles = [[NSMutableArray alloc] init];
        _isDone = false;
    }
    return self;
}

- (void)start {
    [_parser parse];
}

// Called when data has downloaded and parsing has begun
- (void)feedParserDidStart:(MWFeedParser *)parser {
//    NSLog(@" - feedParserDidStart");
}

// Provides info about the feed
- (void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info {
//    NSLog(@" - didParseFeedInfo");
}

// Provides info about a feed item
- (void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item {
    
    item.title = item.title ? item.title : @"[No Title]";
    item.link = item.link ? item.link : @"[No Link]";
    item.author = item.author ? item.author : @"[No Author]";
    if (item.summary) {
        item.summary = [self formatSummary:item.summary];
    } else {
        item.summary = @"[No Summary]";
    }

    item.content = item.content ? item.content : @"[No Content]";
    item.identifier = item.identifier ? item.identifier : @"[No Id]";
    
    [_articles addObject:item];
}

// Parsing complete or stopped at any time by `stopParsing`
- (void)feedParserDidFinish:(MWFeedParser *)parser {
    _isDone = true;
}

// Parsing failed
- (void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error {
    NSLog(@"[ERROR] - Parsing failed");
}

- (NSString *)formatSummary:(NSString *)summary {
    NSArray *strings = [summary componentsSeparatedByString:@"<font size=\"-1\">"];
    NSString *str = [[strings[2] componentsSeparatedByString:@"&nbsp"][0]
                    stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"];
    str = [str stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    return str;
}

@end