//
//  SongDetailViewController.h
//  Music Search
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelClass.h"
@interface SongDetailViewController : UIViewController 

@property (nonatomic, strong) IBOutlet UILabel * songLabel;
@property (strong, nonatomic) IBOutlet UILabel * artistLabel;
@property (strong, nonatomic) IBOutlet UILabel * albumLabel;
@property (strong, nonatomic) IBOutlet UILabel * urlLabel;
@property (strong, nonatomic) IBOutlet UIWebView * urlWebView;
@property (strong, nonatomic) IBOutlet UIImageView * urlImageView;
@property (strong, nonatomic) IBOutlet UIWebView *urlLyricsWebView;
@property (strong, nonatomic) IBOutlet UIImageView *urlWebImageView;

@property(nonatomic,strong)ModelClass* songInformation;


@end
