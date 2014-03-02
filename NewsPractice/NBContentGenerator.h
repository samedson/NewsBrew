//
//  NBContentGenerator.h
//  NewsBrew
//
//  Created by Samuel Edson on 3/1/14.
//  Copyright (c) 2014 Dylan Hallman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBContentGenerator : NSObject {
    // 1 >>>>>> PRIVATE
    
    NSDictionary *preferences;

}   // >>>>>> 1


// 2 >>>>>> PROPERTIES
@property (strong, nonatomic) NSDictionary *preferences;


// >>>>>> 2

// PUBLIC METHODS
+ (id)sharedInstance;


@end
