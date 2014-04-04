//
//  NBContentGenerator.h
//  NewsBrew
//
//  Created by Samuel Edson on 3/1/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MWFeedParser.h"

#import "NBParser.h"

@interface NBContentGenerator : NSObject

- (id)initWithRSSURLs:(NSArray *)RSSURLs preferences:(NSArray *)preferences;
- (void)beginWhenParsingFinishes;

@property (strong, nonatomic) NSArray *preferences;
@property (strong, nonatomic) NSArray *parsers;
@property (strong, nonatomic) NSMutableArray *articles;

@property (retain, nonatomic) NBParser *USParser;
@property (retain, nonatomic) NBParser *WorldParser;
@property (retain, nonatomic) NBParser *BusinessParser;
@property (retain, nonatomic) NBParser *TechParser;
@property (retain, nonatomic) NBParser *ScienceParser;
@property (retain, nonatomic) NBParser *SportsParser;
@property (retain, nonatomic) NBParser *EntertainmentParser;
@property (retain, nonatomic) NBParser *HealthParser;

@end
