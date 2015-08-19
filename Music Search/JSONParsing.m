//
//  JSONParsing.m
//  Music Search
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import "JSONParsing.h"

@interface JSONParsing ()

@property (nonatomic, strong) NSData *jsonData;

@end

@implementation JSONParsing

- (instancetype)initWithData: (NSData *) jsonData
{
    NSLog(@"Init With Data JSON");
    self = [super init];
    if (self)
    {
        _jsonData = jsonData;
    }
    return self;
}

- (void) startParsing
{
    NSLog(@"Start Parsing JSON");
    NSError * error;
    NSObject * obj;
    
    
    // Check if the object is of a specific subclass.
    if ([obj isKindOfClass:[NSDictionary class]])
    {
    }
    
    NSLog(@"NSJSON Reading arguments");
    
    NSDictionary * resultDictionary = [NSJSONSerialization JSONObjectWithData:self.jsonData options:NSJSONReadingAllowFragments error:&error];

    if (!error)
    {
        //NSLog(@"Not Error :D ");
      [self.delegate JSONParsing:self didFinishParsingWithResult:resultDictionary];
       // NSMutableArray *mutableArray = [NSMutableArray init];
       //[self.delegate JSONParsing:self didFinishParsingWithResult:mutableArray];
    }
    NSLog(@"End of the startParsing Method");
}

@end
