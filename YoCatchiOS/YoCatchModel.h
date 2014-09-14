//
//  YoCatchModel.h
//  YoCatchiOS
//
//  Created by Kurt Robinson on 7/09/2014.
//  Copyright (c) 2014 Kurt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YoCatchModel : NSObject

-(instancetype) initWithUsername: NSString;

/**
 Name of the Yo user. Currently this is local */
@property (nonatomic, strong) NSString* username;

/**
 History of the messages sent with Yo */
@property (nonatomic, strong, readonly) NSMutableArray* historyArray;


- (NSString*) yoMessage;


- (void) addToArray: (NSString*) stringParam;
- (void) printArray;

@end
