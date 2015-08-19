//
//  Connection.m
//  Music Search
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Connection.h"

static NSString *const urlString = @"http://www.w3schools.com/xml/simple.xml";



static NSString *const urlStringForJSON = @"https://itunes.apple.com/search?term=0";
static NSString *const urlStringtoSearchForJSON = @"https://itunes.apple.com/search?term=";

@interface Connection()

@property (nonatomic, strong) NSMutableData *xmlData;

@end

@implementation Connection


- (void) downloadFile
{
    NSLog(@"Connection dowloadfile");
    self.xmlData = [[NSMutableData alloc] init];
    
    // For XML
    // NSURL *url = [NSURL URLWithString:urlString];
    
    // For JSON
    NSURL * url = [NSURL URLWithString:urlStringForJSON];
    
    NSLog(@"Request to the URL without search ");
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url cachePolicy:1 timeoutInterval:3];
    NSLog(@"Makes the connection with the request");
    NSURLConnection * con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDelegate

-(void) downloadFileSearch:(NSString *)searchwords
{
    // Method to dowload the JSON file with the search words
    NSLog(@"Connection downloadFileSearch");
    self.xmlData = [[NSMutableData alloc] init];
    
    NSLog(@"Search words -> %@", searchwords);
    
    searchwords = [searchwords stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSLog(@"Search words -> %@", searchwords);
    
    NSString * urlStringSearchForJSON = [urlStringtoSearchForJSON stringByAppendingString:searchwords];
    
    // For JSON
    NSURL * url = [NSURL URLWithString:urlStringSearchForJSON];
    
    NSLog(@"NSURL with Search -> %@", url);
    
    NSLog(@"Request to the URL with seach words");
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url cachePolicy:1 timeoutInterval:3];
    NSLog(@"Makes the connection with the request with the words to search");
    NSURLConnection * con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Executed when the response is constructed.
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Executed when chunks of data are recieved
    [self.xmlData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Executed when the entire response is finished downloading
    [self.delegate connection:self didFinishWithResultData:self.xmlData];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Executed when the connection is terminated due to error.
    NSLog(@"There's something wrong here");
    
    [self downloadFile];
}

@end