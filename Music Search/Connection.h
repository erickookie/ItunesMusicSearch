//
//  Connection.h
//  Music Search
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Connection;

@protocol ConnectionDelegate <NSObject>

- (void) connection: (Connection *) connection didFinishWithResultData: (NSData *) resultData;

@end

@interface Connection : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) id<ConnectionDelegate> delegate;

- (void) downloadFile;
- (void) downloadFileSearch : (NSString *) searchwords;
@end
