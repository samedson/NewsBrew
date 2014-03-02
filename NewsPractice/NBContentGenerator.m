//
//  NBContentGenerator.m
//  NewsBrew
//
//  Created by Samuel Edson on 3/1/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import "NBContentGenerator.h"

@implementation NBContentGenerator


// 3 >>>>>> SYNTHESIS
@synthesize preferences;

// >>>>>> 3

#pragma mark Singleton Methods
+ (id)sharedInstance {
    static NBContentGenerator *sharedSettings = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSettings = [[self alloc] init];
    });
    return sharedSettings;
}

- (id)init {
    if (self = [super init]) {
        // 4 >>>>>> INITIALIZATION
            
        // >>>>>> 4
    }
    return self;
}










@end



