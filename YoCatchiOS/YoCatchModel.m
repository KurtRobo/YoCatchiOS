//
//  YoCatchModel.m
//  YoCatchiOS
//
//  Created by Kurt Robinson on 7/09/2014.
//  Copyright (c) 2014 Kurt. All rights reserved.
//

#import "YoCatchModel.h"

@implementation YoCatchModel

/*- (instancetype)init
{

    return self;
}*/

- (instancetype)initWithUsername:(NSString*) user
{
    _historyArray = [[NSMutableArray alloc] init];

    self.username = user;
    
    return self;
}

- (NSString*) yoMessage
{
    
    NSString *yoString = @"Yo";
    NSString *returnString = [NSString stringWithFormat: @"%@ %@", yoString, self.username];
    
    return returnString;
}

- (void) addToArray: (NSString*) stringParam
{
    [self.historyArray addObject:stringParam];
    
}

- (void) printArray
{
    //Output via for loop
    for(int i = 0; i < sizeof(_historyArray); i++) {
        NSLog(@"%@", [self.historyArray objectAtIndex:i]);
    }
    
    for(NSString *aString in self.historyArray)
    {
        NSLog(@"%@",aString);
    }
    
}

@end
