//
//  NBParser.h
//  NewsBrew
//
//  Created by Samuel Edson on 4/4/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MWFeedParser.h"

@interface NBParser : NSObject <MWFeedParserDelegate>

- (id)initWithURL:(NSURL *)url;

- (void)start;

@property (strong, nonatomic) MWFeedParser *parser;
@property (strong, nonatomic) NSMutableArray *articles;
@property (nonatomic) BOOL isDone;

@end
